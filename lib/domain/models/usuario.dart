class Usuario {
  final String id;
  final String nombre;
  final String rol;
  final String usuario;
  final String contrasena;

  Usuario({
    required this.id,
    required this.nombre,
    required this.usuario,
    required this.contrasena,
    required this.rol,
  });

  factory Usuario.desdeJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      nombre: json['nombre'],
      usuario: json['usuario'],
      contrasena: json['contrasena'],
      rol: json['rol'],
    );
  }
}

class UsuarioFirebase {
  final String nombre;
  final String rol;
  final String correo;

  UsuarioFirebase({
    required this.nombre,
    required this.correo,
    required this.rol,
  });

  factory UsuarioFirebase.desdeDoc(Map<String, dynamic> data) {
    return UsuarioFirebase(
      nombre: data['nombre'] ?? '',
      correo: data['correo'] ?? '',
      rol: data['rol'] ?? '',
    );
  }
}
