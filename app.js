const ejs = require('ejs');
const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
const logger = require('morgan');
const session = require('express-session');

const dashboardRouter = require('./routes/dashboard');
const familyRouter = require('./routes/family');
const loginRouter = require('./routes/login');
const mandalRouter = require('./routes/add-mandal');
const memberRouter = require('./routes/member');
const actionRouter = require('./routes/action');
const printRouter = require('./routes/print')

const app = express();

// middleware to check if user is authenticated
const authUser = (req, res, next) => {
  if (req.session && req.session.authenticated) {
    next();
  } else {
    res.redirect('/login');
  }
};

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.engine('html', ejs.renderFile);
app.set('view engine', 'html');

app.use(express.static('public'));
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, '/public')));


app.use(session({
  secret: 'your-secret-key',
  resave: false,
  saveUninitialized: true,
  cookie: { secure: false, 
            //maxAge: 3600000
           },
}));



app.use('/login', loginRouter);

app.use('/', authUser, dashboardRouter);
app.use('/dashboard', authUser, dashboardRouter);
app.use('/family', authUser, familyRouter);
app.use('/add-mandal', authUser, mandalRouter);
app.use('/member', authUser, memberRouter);
app.use('/action', authUser, actionRouter);
app.use('/print',authUser,printRouter);

module.exports = app;

app.listen(5000);
