Title: Where is the sqlite file for my Flask app
Date: 2015-04-24 13:34
Author: srini
Category: software
Tags: macosx, python, flask
Slug: where-is-the-sqlite-file-for-my-flask-app

I am really enjoying working with the Python Flask Web Framework. I won
a O'Reilly book last year on Flask Web Development by Miguel Grinberg and am
finally getting around to reading it and trying out what the book teaches. So
far it's been excellent!

From the start of the book we develop a simple app and add new features as we
learn new concepts. I got to the Databases chapter and hit my first roadblock!
The book teaches you to use SQLAlchemy for database management which is good. 
That way you interact with one library and behind the scenes you can have any 
of the supported databases. For the examples in the book we used sqlite.

Here is the snippet I typed in to create my database instance. This is not a complete
working snippet. It just has parts which are relevant to start using
SQLAlchemy.

    ::::python
    from flask_sqlalchemy import SQLAlchemy

    basedir = os.path.abspath(os.path.dirname(__file__))

    app = Flask(__name__)
    app.config['SQLALCHEMY_DATA_BASE_URI'] =\
        'sqlite:////' + os.path.join(basedir, 'data.sqlite')
    app.config['SQLALCHEMY_COMMIT_ON_TEARDOWN'] = True

    db = SQLAlchemy(app) 

I then define my database models. The book shows us examples on how to create
User table and Role table and how they are related. Then to exercise different
database operations it shows how you can open a Flask shell and try out the
different commands on the command prompt. The flask shell is possible because
of the Flask-Script extension. All you have to do is to first install
flask-script in your virtualenv

    ::::bash
    $ pip install flask-script

then in your flask app use the Manager provided by flask_script - 

    ::::python
    from flask import Flask
    from flask_script import Manager

    app = Flask(__name__)
    manager = Manager(app)

    # ...

    if __name__ = '__main__':
        manager.run()

This allows you to interact with your flask app on the command line. This also
lets you open a python shell while the app is running. Works great for testing
purposes. 

So with the database instance defined, I opened the python shell to test out
the different database operations. The first command you learn is the
create_all command. This creates your tables based on the model you defined.
Here is my interactive session - 

    ::::python
    (venv) $ python hello.py shell
    >>> from hello import db
    >>> db.create_all()

At this point the application directory should have a new file called
data.sqlite. This is the name we gave to  our database in app.config above. I
did not see the file in the application directory. I proceeded with the
exercise of creating roles and users and commiting my work. I could query the
tables too. I checked the application directory again and again didnt see the
file. This was getting wierd!! where is the file???

I turned to google and found a solution on stackoverflow. It turns out that I
had a typo in my configuration for the database, because of which my database
was created in memory. That was sneaky! I would have preffered an error
instead. In the config secriotn, instead of 'SQLALCHEMY_DATA_BASE_URI' it should have been
'SQLALCHEMY_DATABASE_URI'. 

Here is the corrected snippet

    ::::python
    from flask_sqlalchemy import SQLAlchemy

    basedir = os.path.abspath(os.path.dirname(__file__))

    app = Flask(__name__)
    app.config['SQLALCHEMY_DATABASE_URI'] =\
        'sqlite:////' + os.path.join(basedir, 'data.sqlite')
    app.config['SQLALCHEMY_COMMIT_ON_TEARDOWN'] = True

    db = SQLAlchemy(app) 
