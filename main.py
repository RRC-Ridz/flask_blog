from flask import Flask,render_template,request,session,redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import json
from flask_mail import Mail
import os
from werkzeug.utils import secure_filename
import math

local_server='True'
with open("config.json",'r') as c:
    params=json.load(c)["params"]
app=Flask(__name__)
app.secret_key = 'the random string'
app.config.update( 
        
        MAIL_SERVER='smtp.gmail.com',
        MAIL_PORT="465",
        MAIL_USE_SSL=True,
        MAIL_USERNAME=params["gmail-user"],
        MAIL_PASSWORD=params["gmail-password"],
        UPLOAD_FOLDER=params["upload_location"]
                  
)

mail=Mail(app)

if params['local_server']:
    app.config['SQLALCHEMY_DATABASE_URI']=params["local_uri"]

else:
    app.config['SQLALCHEMY_DATABASE_URI']=params["prod_uri"]
    
    
    



db=SQLAlchemy(app)

class Contact(db.Model):
    sno=db.Column(db.Integer,primary_key=True)
    name=db.Column(db.String(70),nullable=False)
    email=db.Column(db.String(20),nullable=False)
    phone_num=db.Column(db.String(12),nullable=False)
    msg=db.Column(db.String(120),nullable=False)
    date=db.Column(db.String(12),nullable=False)
    
class Posts(db.Model):
    sno=db.Column(db.Integer,primary_key=True)
    title=db.Column(db.String(70),nullable=False)
    slug=db.Column(db.String(21),nullable=False)
    content=db.Column(db.String(120),nullable=False)
    date=db.Column(db.String(12),nullable=False)
    tagline=db.Column(db.String(120),nullable=False)
    img_file=db.Column(db.String(12),nullable=True)
@app.route("/")
def home():
    posts=Posts.query.filter_by().all()
    last=math.ceil((len(posts)/int(params['no_of_posts'])))
    page=request.args.get('page')
    if not str(page).isnumeric():
        page=1
    page=int(page)
    previous="/?page="+str(int(page)-1)
    next="/?page="+str(int(page)+1)
    if page==1:
        previous='#'
    
        
    if page==last:
        next='#'
        
    
        
        
    posts=posts[(page-1)*int(params['no_of_posts']):(page-1)*int(params['no_of_posts'])+int(params['no_of_posts'])]
    return render_template("index.html",params=params,posts=posts,previous=previous,next=next)

@app.route("/dashboard", methods=['GET','POST'])
def dashboard():
    if 'user' in session and session['user']==params['admin_user']:
        posts=Posts.query.all()
        return render_template("dashboard.html",params=params,posts=posts)
    if request.method=='POST':
        email=request.form.get('email')
        password=request.form.get('password')
        if email==params['admin_user'] and password==params['admin_password']:
            session['user']=email
            posts=Posts.query.all()
            return render_template("dashboard.html",params=params,posts=posts)
        else:
            return render_template("login.html",params=params)
               
    else: 
        return render_template("login.html",params=params)
    



@app.route("/about")
def about():
    return render_template("about.html",params=params)

@app.route("/contact",methods=['GET','POST'])
def contact():
    if request.method=='POST':
        
        name=request.form.get("name")
        email=request.form.get("email")
        phone=request.form.get("phone")
        message=request.form.get("message")
        date=datetime.now()
        entry=Contact(name=name,phone_num=phone,msg=message,email=email,date=date)
        
        db.session.add(entry)
        db.session.commit()
        mail.send_message("MESSAGE FROM "+params['blog_name'],
                          sender=params['gmail-user'],
                          recipients=[email],
                          body="Hello "+name+"\n"+message
                          )
    return render_template("contact.html",params=params)

@app.route("/post/<string:post_slug>",methods=['GET'])
def post_route(post_slug):
    post=Posts.query.filter_by(slug=post_slug).first()
    
    return render_template("post.html",params=params,post=post)



@app.route("/edit/<string:sno>",methods=['GET','POST'])
def edit(sno):
    if 'user' in session and session['user']==params['admin_user']:
        if request.method=='POST':
            title=request.form.get('title')
            tagline=request.form.get("tline")
            slug=request.form.get('slug')
            content=request.form.get('content')
            img_file=request.form.get('img_file')
            date=datetime.now()
            
            if sno=='0':
                post=Posts(title=title,tagline=tagline,slug=slug,content=content,img_file=img_file,date=date)
                db.session.add(post)
                db.session.commit()
                return redirect("/dashboard")
                
            else:
                post=Posts.query.filter_by(sno=sno).first()
                post.title=title
                post.slug=slug
                post.tagline=tagline
                post.content=content
                post.date=date
                post.img_file=img_file 
                db.session.commit() 
                return redirect('/dashboard')  
        post=Posts.query.filter_by(sno=sno).first()
        return render_template("edit.html",params=params,post=post,sno=sno)
    

@app.route("/logout")
def logout():
    session.pop('user')
    return redirect("/dashboard")

@app.route("/uploader",methods=['GET','POST'])
def uploader():
    if 'user' in session and session['user']==params['admin_user']:
        f=request.files['file1']
        f.save(os.path.join(app.config['UPLOAD_FOLDER'],secure_filename(f.filename)))
        return "Uploaded Successfully"


@app.route("/delete/<string:sno>/",methods=['GET','POST'])
def delete(sno):
    if 'user' in session and session['user']==params['admin_user']:
        post=Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
        return redirect("/dashboard")

if __name__=="__main__":
    app.run(debug=True)