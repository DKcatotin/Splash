import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final isLoggedIn = authService.isAuthenticated;
    final userName = authService.userName ?? 'Usuario';
    final userEmail = authService.userEmail ?? 'usuario@ejemplo.com';

    return Scaffold(
      appBar: AppBar(title: const Text('Mi Perfil'), centerTitle: true),
      body:
          isLoggedIn
              ? _buildLoggedInView(context, authService, userName, userEmail)
              : _buildLoggedOutView(context),
    );
  }

  // 🔹 Vista cuando el usuario NO está logueado
  Widget _buildLoggedOutView(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_circle_outlined,
              size: 120,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 24),
            const Text(
              'Inicia sesión para acceder a tu perfil',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            Text(
              'Guarda tus productos favoritos, revisa tus pedidos y mucho más',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/login'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Iniciar Sesión',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Navigator.pushNamed(context, '/register'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Crear Cuenta',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Vista cuando el usuario SÍ está logueado
  Widget _buildLoggedInView(
    BuildContext context,
    AuthService authService,
    String userName,
    String userEmail,
  ) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor.withOpacity(0.8),
                ],
              ),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Text(
                    userName[0].toUpperCase(),
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  userName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  userEmail,
                  style: const TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),
          _buildMenuItem(
            context,
            Icons.person_outline,
            'Editar Perfil',
            'Actualiza tu información personal',
          ),
          const Divider(height: 1),
          _buildMenuItem(
            context,
            Icons.shopping_bag_outlined,
            'Mis Pedidos',
            'Revisa el estado de tus compras',
          ),
          const Divider(height: 1),
          _buildMenuItem(
            context,
            Icons.location_on_outlined,
            'Direcciones',
            'Administra tus direcciones de envío',
          ),
          const Divider(height: 1),
          _buildMenuItem(
            context,
            Icons.payment_outlined,
            'Métodos de Pago',
            'Gestiona tus tarjetas y pagos',
          ),
          const Divider(height: 1),
          _buildMenuItem(
            context,
            Icons.notifications_outlined,
            'Notificaciones',
            'Configura tus preferencias',
          ),
          const Divider(height: 1),
          _buildMenuItem(
            context,
            Icons.help_outline,
            'Ayuda y Soporte',
            '¿Necesitas ayuda?',
          ),
          const Divider(height: 1),
          _buildMenuItem(
            context,
            Icons.settings_outlined,
            'Configuración',
            'Ajustes de la aplicación',
          ),
          const Divider(height: 1),

          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () async {
                  await authService.logout();
                  if (context.mounted) {
                    Navigator.pushReplacementNamed(
                      context,
                      '/login',
                    ); // 👈 Redirige al login
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Sesión cerrada exitosamente'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                },

                icon: const Icon(Icons.logout, color: Colors.red),
                label: const Text(
                  'Cerrar Sesión',
                  style: TextStyle(color: Colors.red),
                ),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(color: Colors.red),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
  ) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Theme.of(context).primaryColor),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('$title en desarrollo')));
      },
    );
  }
}
