const UsersController = require('../controllers/usersController');
const passport = require('passport');


module.exports = (app, upload) => {
    
    // TRAER DATOS
    app.get('/api/users/getAll', UsersController.getAll);

    // GUARDAR DATOS
    app.post('/api/users/create', UsersController.register);
    app.post('/api/users/login', UsersController.login);

    // Actualizar datos
    //401 UNAUTHOclear

    app.put('/api/users/update', passport.authenticate('jwt', {session: false}), upload.array('image', 1), UsersController.update);
    app.put('/api/users/updateWithoutImage', passport.authenticate('jwt', {session: false}), UsersController.updateWithoutImage);
}
