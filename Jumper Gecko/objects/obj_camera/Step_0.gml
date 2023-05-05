camera_set_view_size(view_camera[0], global.cameraWidth, global.cameraHeight);

var _cameraX = camera_get_view_x(view_camera[0]);
var _cameraY = camera_get_view_y(view_camera[0]);

var _targetX = obj_player.x - (global.cameraWidth*0.5);
var _targetY = obj_player.y - (global.cameraHeight*0.5);

camera_set_view_pos(view_camera[0], lerp(_cameraX, _targetX, 0.1), lerp(_cameraY, _targetY, 0.1));