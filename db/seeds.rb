# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name_en: 'Star Wars' }, { name_en: 'Lord of the Rings' }])
#   Character.create(name_en: 'Luke', movie: movies.first)
#
#   For More Information, 
#   @see https://guides.rubyonrails.org/v5.1/active_record_migrations.html#migrations-and-seed-data

def create_admin(name, mail, pass)
    admin = User.new(name: name, email: mail, password: pass, password_confirmation: pass, role: "admin" )
    admin.skip_confirmation!
    if admin.save!
        puts "El administrador: #{admin.email} ha sido creado."
    else
        puts "Error:#{admin.email} > #{admin.errors.full_messages}"
    end
end

def create_page(category="static", lang="en", title="", slug="/", content="lorem ipsum...")
    page = Page.create({
        lang: lang,
        slug: slug,
        title: title,
        og_title: title,
        content: content,
        category: category,
        restricted: true
    })
    if page.save
        puts "La página #{title} ha sido creada"
    else
        puts "Error:#{lang}:#{title} > #{page.errors.full_messages}"
    end
end

User.all.delete_all
Page.all.delete_all
Country.all.delete_all

Equill.create([
    { name: "Enjambre" },
    { name: "Espuma" },
    { name: "Portal" },
    { name: "Bulbo" },
    { name: "Esgrafiado" },
    { name: "Acorde" }
])

create_admin('JuanFuent.es', 'input@juanfuent.es', '3Qui1ls2024')

lorem = Faker::Hacker.say_something_smart
create_page('static', 'es', 'eQuills', 'es', "eQuills es el término que adoptamos para referirnos a las herramientas de escritura digital que desarrollamos con el objetivo de dejar marcas imposibles de crear en el mundo físico. Suena bien ¿Cierto? Pruébalo tú mismo.")
create_page('static', 'es', 'Contacto', 'contacto', Faker::Hacker.say_something_smart)
create_page('static', 'es', 'Galería', 'galeria', Faker::Hacker.say_something_smart)
create_page('static', 'es', 'Manifiesto', 'manifiesto', Faker::Hacker.say_something_smart)
# create_page('static', 'es', 'Aviso de Privacidad', 'privacidad', Faker::Hacker.say_something_smart)
# create_page('static', 'es', 'Términos y Condiciones', 'terminos', Faker::Hacker.say_something_smart)

create_page('static', 'en', 'eQuills', 'en', "eQuills is the term we adopt to refer to the digital writing tools we develop with the goal of leaving marks impossible to create in the physical world. Sounds good, right? Try it yourself.")
create_page('static', 'en', 'Gallery', 'gallery', Faker::Hacker.say_something_smart)
create_page('static', 'en', 'Contact', 'contact', Faker::Hacker.say_something_smart)
create_page('static', 'en', 'Manifest', 'manifest', Faker::Hacker.say_something_smart)

# create_page('static', 'en', 'Privacy Policy', 'privacy', Faker::Hacker.say_something_smart)
# create_page('static', 'en', 'Terms and Conditions', 'terms', Faker::Hacker.say_something_smart)

# errors
#en
create_page('errors', 'en', 'Page Not Found', '404', 'The page you are trying to access does not exist, has been moved, or has been deleted.')
create_page('errors', 'en', 'Unprocessable Entity', '422', 'The request could not be processed. Please try again later.')
create_page('errors', 'en', 'Server Error', '500', 'An error has occurred on the server. Please try again later.')
create_page('errors', 'en', 'Offline', 'offline', "You're disconnected. Check your internet Wi-Fi connection, mobile data or lan cable.")
#es
create_page('errors', 'es', 'Página no encontrada', '404', 'La página a la que intentas acceder no existe, se ha movido o se ha eliminado.')
create_page('errors', 'es', 'Petición no resuelta', '422', 'La petición no pudo ser procesada. Por favor, reintenta de nuevo más tarde.')
create_page('errors', 'es', 'Error de Servidor', '500', 'Ha ocurrido un error en servidor. Por favor, reintenta de nuevo más tarde.')
create_page('errors', 'es', 'Offline', 'offline', "Estás desconectado. Verifica tu conexión wifi, datos móviles o cable lan.")
# devise
# en
create_page('users', 'es', 'Crear Cuenta', 'sign_up', 'Completa los siguientes campos para crear tu cuenta.')
create_page('users', 'es', 'Iniciar Sesión', 'sign_in', 'Escribe tu mail y contraseña para acceder a la plataforma.')
create_page('users', 'es', 'Confirmación de Cuenta', 'confirmation', 'Para acceder a la plataforma necesitas primero confirmar tu cuenta, escribe tu email para recibir las instrucciones de confirmación.')
create_page('users', 'es', 'Recuperar Cuenta', 'reset_password', 'Ingresa tu e-mail para recibir un correo de recuperación.')
create_page('users', 'es', 'Desbloquear Cuenta', 'unlock', 'Ingresa tu e-mail para recibir instrucciones para desbloquear tu cuenta.')
# es
create_page('users', 'en', 'Create Account', 'sign_up', 'Complete the following fields for create your account.')
create_page('users', 'en', 'Sign In', 'sign_in', 'Write your email and password for access to the platform.')
create_page('users', 'en', 'Account Confirmation', 'confirmation', 'To access the platform you first need to confirm your account, enter your email to receive confirmation instructions.')
create_page('users', 'en', 'Reset Password', 'reset_password', 'Write your email to follow a recovery email.')
create_page('users', 'en', 'Unlock Account', 'unlock', 'Write your email for receive instructions for unblock your account.')

#countries
Country.create([
    { continent: 'Asia', name_es: 'Afganistán', name_en: 'Afghanistan', code: '93', alpha_2: 'AF', alpha_3: 'AFG' },
    { continent: 'Europa', name_es: 'Albania', name_en: 'Albania', code: '355', alpha_2: 'AL', alpha_3: 'ALB' },
    { continent: 'Africa', name_es: 'Argelia', name_en: 'Algeria', code: '213', alpha_2: 'DZ', alpha_3: 'DZA' },
    { continent: 'Oceania', name_es: 'Samoa Americana', name_en: 'American Samoa', code: '1-684', alpha_2: 'AS', alpha_3: 'ASM' },
    { continent: 'Europa', name_es: 'Andorra', name_en: 'Andorra', code: '376', alpha_2: 'AD', alpha_3: 'AND' },
    { continent: 'Africa', name_es: 'Angola', name_en: 'Angola', code: '244', alpha_2: 'AO', alpha_3: 'AGO' },
    { continent: 'America', sub_continent: 'North America', name_es: 'Anguila', name_en: 'Anguilla', code: '1-264', alpha_2: 'AI', alpha_3: 'AIA' },
    { continent: 'Antarctica', name_es: 'Antártida', name_en: 'Antarctica', code: '672', alpha_2: 'AQ', alpha_3: 'ATA' },
    { continent: 'America', sub_continent: 'North America', name_es: 'Antigua y Barbuda', name_en: 'Antigua and Barbuda', code: '1-268', alpha_2: 'AG', alpha_3: 'ATG' },
    { continent: 'America', sub_continent: 'South America', name_es: 'Argentina', name_en: 'Argentina', code: '54', alpha_2: 'AR', alpha_3: 'ARG' },
    { continent: 'Asia', name_es: 'Armenia', name_en: 'Armenia', code: '374', alpha_2: 'AM', alpha_3: 'ARM' },
    { continent: 'America', sub_continent: 'North America', name_es: 'Aruba', name_en: 'Aruba', code: '297', alpha_2: 'AW', alpha_3: 'ABW' },
    { continent: 'Oceania', name_es: 'Australia', name_en: 'Australia', code: '61', alpha_2: 'AU', alpha_3: 'AUS' },
    { continent: 'Europa', name_es: 'Austria', name_en: 'Austria', code: '43', alpha_2: 'AT', alpha_3: 'AUT' },
    { continent: 'Asia', name_es: 'Azerbaiyán', name_en: 'Azerbaijan', code: '994', alpha_2: 'AZ', alpha_3: 'AZE' },
    { continent: 'America', sub_continent: 'North America', name_es: 'bahamas', name_en: 'Bahamas', code: '1-242', alpha_2: 'BS', alpha_3: 'BHS' },
    { continent: 'Asia', name_es: 'Baréin', name_en: 'Bahrain', code: '973', alpha_2: 'BH', alpha_3: 'BHR' },
    { continent: 'Asia', name_es: 'Bangladesh', name_en: 'Bangladesh', code: '880', alpha_2: 'BD', alpha_3: 'BGD' },
    { continent: 'America', sub_continent: 'North America', name_es: 'Barbados', name_en: 'Barbados', code: '1-246', alpha_2: 'BB', alpha_3: 'BRB' },
    { continent: 'Europa', name_es: 'Bielorrusia', name_en: 'Belarus', code: '375', alpha_2: 'BY', alpha_3: 'BLR' },
    { continent: 'Europa', name_es: 'Bélgica', name_en: 'Belgium', code: '32', alpha_2: 'BE', alpha_3: 'BEL' },
    { continent: 'America', sub_continent: 'North America', name_es: 'Belice', name_en: 'Belize', code: '501', alpha_2: 'BZ', alpha_3: 'BLZ' },
    { continent: 'Africa', name_es: 'Benín', name_en: 'Benin', code: '229', alpha_2: 'BJ', alpha_3: 'BEN' },
    { continent: 'America', sub_continent: 'North America', name_es: 'Islas Bermudas', name_en: 'Bermuda', code: '1-441', alpha_2: 'BM', alpha_3: 'BMU' },
    { continent: 'Asia', name_es: 'Bután', name_en: 'Bhutan', code: '975', alpha_2: 'BT', alpha_3: 'BTN' },
    { continent: 'America', sub_continent: 'South America', name_es: 'Bolivia', name_en: 'Bolivia', code: '591', alpha_2: 'BO', alpha_3: 'BOL' },
    { continent: 'Europa', name_es: 'Bosnia y Herzegovina', name_en: 'Bosnia and Herzegovina', code: '387', alpha_2: 'BA', alpha_3: 'BIH' },
    { continent: 'Africa', name_es: 'Botsuana', name_en: 'Botswana', code: '267', alpha_2: 'BW', alpha_3: 'BWA' },
    { continent: 'America', sub_continent: 'South America', name_es: 'Brasil', name_en: 'Brazil', code: '55', alpha_2: 'BR', alpha_3: 'BRA' },
    { continent: 'Africa', name_es: 'Territorio Británico del Océano Índico', name_en: 'British Indian Ocean Territory', code: '246', alpha_2: 'IO', alpha_3: 'IOT' },
    { continent: 'America', sub_continent: 'North America', name_es: 'Islas Vírgenes Británicas', name_en: 'British Virgin Islands', code: '1-284', alpha_2: 'VG', alpha_3: 'VGB' },
    { continent: 'Asia', name_es: 'Brunéi', name_en: 'Brunei', code: '673', alpha_2: 'BN', alpha_3: 'BRN' },
    { continent: 'Europa', name_es: 'Bulgaria', name_en: 'Bulgaria', code: '359', alpha_2: 'BG', alpha_3: 'BGR' },
    { continent: 'Africa', name_es: 'Burkina Faso', name_en: 'Burkina Faso', code: '226', alpha_2: 'BF', alpha_3: 'BFA' },
    { continent: 'Africa', name_es: 'Burundi', name_en: 'Burundi', code: '257', alpha_2: 'BI', alpha_3: 'BDI' },
    { continent: 'Asia', name_es: 'Camboya', name_en: 'Cambodia', code: '855', alpha_2: 'KH', alpha_3: 'KHM' },
    { continent: 'Africa', name_es: 'Camerún', name_en: 'Cameroon', code: '237', alpha_2: 'CM', alpha_3: 'CMR' },
    { continent: 'America', sub_continent: 'North America', name_es: 'Canadá', name_en: 'Canada', code: '1', alpha_2: 'CA', alpha_3: 'CAN' },
    { continent: 'Africa', name_es: 'Cabo Verde', name_en: 'Cape Verde', code: '238', alpha_2: 'CV', alpha_3: 'CPV' },
    { continent: 'America', sub_continent: 'North America', name_es: 'Islas Caimán', name_en: 'Cayman Islands', code: '1-345', alpha_2: 'KY', alpha_3: 'CYM' },
    { continent: 'Africa', name_es: 'República Centroafricana', name_en: 'Central African Republic', code: '236', alpha_2: 'CF', alpha_3: 'CAF' },
    { continent: 'Africa', name_es: 'Chad', name_en: 'Chad', code: '235', alpha_2: 'TD', alpha_3: 'TCD' },
    { continent: 'America', sub_continent: 'South America', name_es: 'Chile', name_en: 'Chile', code: '56', alpha_2: 'CL', alpha_3: 'CHL' },
    { continent: 'Asia', name_es: 'Porcelana', name_en: 'China', code: '86', alpha_2: 'CN', alpha_3: 'CHN' },
    { continent: 'Oceania', name_es: 'Isla de Navidad', name_en: 'Christmas Island', code: '61', alpha_2: 'CX', alpha_3: 'CXR' },
    { continent: 'Asia', name_es: 'Islas Cocos', name_en: 'Cocos Islands', code: '61', alpha_2: 'CC', alpha_3: 'CCK' },
    { continent: 'America', sub_continent: 'South America', name_es: 'Colombia', name_en: 'Colombia', code: '57', alpha_2: 'CO', alpha_3: 'COL' },
    { continent: 'Africa', name_es: 'Comoras', name_en: 'Comoros', code: '269', alpha_2: 'KM', alpha_3: 'COM' },
    { continent: 'Oceania', name_es: 'Islas Cook', name_en: 'Cook Islands', code: '682', alpha_2: 'CK', alpha_3: 'COK' },
    { continent: 'America', sub_continent: 'North America', name_es: 'Costa Rica', name_en: 'Costa Rica', code: '506', alpha_2: 'CR', alpha_3: 'CRI' },
    { continent: 'Europa', name_es: 'Croacia', name_en: 'Croatia', code: '385', alpha_2: 'HR', alpha_3: 'HRV' },
    { continent: 'America', sub_continent: 'North America', name_es: 'Cuba', name_en: 'Cuba', code: '53', alpha_2: 'CU', alpha_3: 'CUB' },
    { continent: 'America', sub_continent: 'North America', name_es: 'curazao', name_en: 'Curacao', code: '599', alpha_2: 'CW', alpha_3: 'CUW' },
    { continent: 'Europa', name_es: 'Chipre', name_en: 'Cyprus', code: '357', alpha_2: 'CY', alpha_3: 'CYP' },
    { continent: 'Europa', name_es: 'República Checa', name_en: 'Czech Republic', code: '420', alpha_2: 'CZ', alpha_3: 'CZE' },
    { continent: 'Africa', name_es: 'República Democrática del Congo', name_en: 'Democratic Republic of the Congo', code: '243', alpha_2: 'CD', alpha_3: 'COD' },
    { continent: 'Europa', name_es: 'Dinamarca', name_en: 'Denmark', code: '45', alpha_2: 'DK', alpha_3: 'DNK' },
    { continent: 'Africa', name_es: 'Yibuti', name_en: 'Djibouti', code: '253', alpha_2: 'DJ', alpha_3: 'DJI' },
    { continent: 'America', sub_continent: 'North America', name_es: 'Dominica', name_en: 'Dominica', code: '1-767', alpha_2: 'DM', alpha_3: 'DMA' },
    { continent: 'America', sub_continent: 'North America', name_es: 'República Dominicana', name_en: 'Dominican Republic', code: '1-809', alpha_2: 'DO', alpha_3: 'DOM' },
    { continent: 'Asia', name_es: 'Timor Oriental', name_en: 'East Timor', code: '670', alpha_2: 'TL', alpha_3: 'TLS' },
    { continent: 'America', sub_continent: 'South America', name_es: 'Ecuador', name_en: 'Ecuador', code: '593', alpha_2: 'EC', alpha_3: 'ECU' },
    { continent: 'Africa', name_es: 'Egipto', name_en: 'Egypt', code: '20', alpha_2: 'EG', alpha_3: 'EGY' },
    { continent: 'America', sub_continent: 'North America', name_es: 'El Salvador', name_en: 'El Salvador', code: '503', alpha_2: 'SV', alpha_3: 'SLV' },
    { continent: 'Africa', name_es: 'Guinea Ecuatorial', name_en: 'Equatorial Guinea', code: '240', alpha_2: 'GQ', alpha_3: 'GNQ' },
    { continent: 'Africa', name_es: 'Eritrea', name_en: 'Eritrea', code: '291', alpha_2: 'ER', alpha_3: 'ERI' },
    { continent: 'Europa', name_es: 'Estonia', name_en: 'Estonia', code: '372', alpha_2: 'EE', alpha_3: 'EST' },
    { continent: 'Africa', name_es: 'Etiopía', name_en: 'Ethiopia', code: '251', alpha_2: 'ET', alpha_3: 'ETH' },
    { continent: 'America', sub_continent: 'South America', name_es: 'Islas Malvinas', name_en: 'Falkland Islands', code: '500', alpha_2: 'FK', alpha_3: 'FLK' },
    { continent: 'Europa', name_es: 'Islas Faroe', name_en: 'Faroe Islands', code: '298', alpha_2: 'FO', alpha_3: 'FRO' },
    { continent: 'Oceania', name_es: 'Fiyi', name_en: 'Fiji', code: '679', alpha_2: 'FJ', alpha_3: 'FJI' },
    { continent: 'Europa', name_es: 'Finlandia', name_en: 'Finland', code: '358', alpha_2: 'FI', alpha_3: 'FIN' },
    { continent: 'Europa', name_es: 'Francia', name_en: 'France', code: '33', alpha_2: 'FR', alpha_3: 'FRA' },
    { continent: 'Oceania', name_es: 'Polinesia francés', name_en: 'French Polynesia', code: '689', alpha_2: 'PF', alpha_3: 'PYF' },
    { continent: 'Africa', name_es: 'Gabón', name_en: 'Gabon', code: '241', alpha_2: 'GA', alpha_3: 'GAB' },
    { continent: 'Africa', name_es: 'Gambia', name_en: 'Gambia', code: '220', alpha_2: 'GM', alpha_3: 'GMB' },
    { continent: 'Asia', sub_continent: "Europa", name_es: 'Georgia', name_en: 'Georgia', code: '995', alpha_2: 'GE', alpha_3: 'GEO' },
    { continent: 'Europa', name_es: 'Alemania', name_en: 'Germany', code: '49', alpha_2: 'DE', alpha_3: 'DEU' },
    { continent: 'Africa', name_es: 'Ghana', name_en: 'Ghana', code: '233', alpha_2: 'GH', alpha_3: 'GHA' },
    { continent: 'Europa', name_es: 'Gibraltar', name_en: 'Gibraltar', code: '350', alpha_2: 'GI', alpha_3: 'GIB' },
    { continent: 'Europa', name_es: 'Grecia', name_en: 'Greece', code: '30', alpha_2: 'GR', alpha_3: 'GRC' },
    { continent: 'America', sub_continent: 'North America', name_es: 'Groenlandia', name_en: 'Greenland', code: '299', alpha_2: 'GL', alpha_3: 'GRL' },
    { continent: 'America', sub_continent: 'North America', name_es: 'Granada', name_en: 'Grenada', code: '1-473', alpha_2: 'GD', alpha_3: 'GRD' },
    { continent: 'Oceania', name_es: 'Guam', name_en: 'Guam', code: '1-671', alpha_2: 'GU', alpha_3: 'GUM' },
    { continent: 'America', sub_continent: 'North America', name_es: 'Guatemala', name_en: 'Guatemala', code: '502', alpha_2: 'GT', alpha_3: 'GTM' },
    { continent: 'Europa', name_es: 'Guernesey', name_en: 'Guernsey', code: '44-1481', alpha_2: 'GG', alpha_3: 'GGY' },
    { continent: 'Africa', name_es: 'Guinea', name_en: 'Guinea', code: '224', alpha_2: 'GN', alpha_3: 'GIN' },
    { continent: 'Africa', name_es: 'Guinea-Bisáu', name_en: 'Guinea-Bissau', code: '245', alpha_2: 'GW', alpha_3: 'GNB' },
    { continent: 'America', sub_continent: 'South America', name_es: 'Guayana', name_en: 'Guyana', code: '592', alpha_2: 'GY', alpha_3: 'GUY' },
    { continent: 'America', sub_continent: 'North America', name_es: 'Haití', name_en: 'Haiti', code: '509', alpha_2: 'HT', alpha_3: 'HTI' },
    { continent: 'America', sub_continent: 'North America', name_es: 'Honduras', name_en: 'Honduras', code: '504', alpha_2: 'HN', alpha_3: 'HND' },
    { continent: 'Asia', name_es: 'Hong Kong', name_en: 'Hong Kong', code: '852', alpha_2: 'HK', alpha_3: 'HKG' },
    { continent: 'Europa', name_es: 'Hungría', name_en: 'Hungary', code: '36', alpha_2: 'HU', alpha_3: 'HUN' },
    { continent: 'Europa', name_es: 'Islandia', name_en: 'Iceland', code: '354', alpha_2: 'IS', alpha_3: 'ISL' },
    { continent: 'Asia', name_es: 'India', name_en: 'India', code: '91', alpha_2: 'IN', alpha_3: 'IND' },
    { continent: 'Asia', sub_continent: "Oceania", name_es: 'Indonesia', name_en: 'Indonesia', code: '62', alpha_2: 'ID', alpha_3: 'IDN' },
    { continent: 'Asia', name_es: 'Irán', name_en: 'Iran', code: '98', alpha_2: 'IR', alpha_3: 'IRN' },
    { continent: 'Asia', name_es: 'Irak', name_en: 'Iraq', code: '964', alpha_2: 'IQ', alpha_3: 'IRQ' },
    { continent: 'Europa', name_es: 'Irlanda', name_en: 'Ireland', code: '353', alpha_2: 'IE', alpha_3: 'IRL' },
    { continent: 'Europa', name_es: 'Isla del hombre', name_en: 'Isle of Man', code: '44-1624', alpha_2: 'IM', alpha_3: 'IMN' },
    { continent: 'Asia', name_es: 'Israel', name_en: 'Israel', code: '972', alpha_2: 'IL', alpha_3: 'ISR' },
    { continent: 'Europa', name_es: 'Italia', name_en: 'Italy', code: '39', alpha_2: 'IT', alpha_3: 'ITA' },
    { continent: 'Africa', name_es: 'Costa de Marfil', name_en: 'Ivory Coast', code: '225', alpha_2: 'CI', alpha_3: 'CIV' },
    { continent: 'America', sub_continent: 'North America', name_es: 'Jamaica', name_en: 'Jamaica', code: '1-876', alpha_2: 'JM', alpha_3: 'JAM' },
    { continent: 'Asia', name_es: 'Japón', name_en: 'Japan', code: '81', alpha_2: 'JP', alpha_3: 'JPN' },
    { continent: 'Europa', name_es: 'Jersey', name_en: 'Jersey', code: '44-1534', alpha_2: 'JE', alpha_3: 'JEY' },
    { continent: 'Asia', name_es: 'Jordán', name_en: 'Jordan', code: '962', alpha_2: 'JO', alpha_3: 'JOR' },
    { continent: 'Asia', sub_continent: "Europa", name_es: 'Kazajistán', name_en: 'Kazakhstan', code: '7', alpha_2: 'KZ', alpha_3: 'KAZ' },
    { continent: 'Africa', name_es: 'Kenia', name_en: 'Kenya', code: '254', alpha_2: 'KE', alpha_3: 'KEN' },
    { continent: 'Oceania', name_es: 'Kiribati', name_en: 'Kiribati', code: '686', alpha_2: 'KI', alpha_3: 'KIR' },
    { continent: 'Europa', name_es: 'Kosovo', name_en: 'Kosovo', code: '383', alpha_2: 'XK', alpha_3: 'XKX' },
    { continent: 'Asia', name_es: 'Kuwait', name_en: 'Kuwait', code: '965', alpha_2: 'KW', alpha_3: 'KWT' },
    { continent: 'Asia', name_es: 'Kirguistán', name_en: 'Kyrgyzstan', code: '996', alpha_2: 'KG', alpha_3: 'KGZ' },
    { continent: 'Asia', name_es: 'Laos', name_en: 'Laos', code: '856', alpha_2: 'LA', alpha_3: 'LAO' },
    { continent: 'Europa', name_es: 'Letonia', name_en: 'Latvia', code: '371', alpha_2: 'LV', alpha_3: 'LVA' },
    { continent: 'Asia', name_es: 'Líbano', name_en: 'Lebanon', code: '961', alpha_2: 'LB', alpha_3: 'LBN' },
    { continent: 'Africa', name_es: 'Lesoto', name_en: 'Lesotho', code: '266', alpha_2: 'LS', alpha_3: 'LSO' },
    { continent: 'Africa', name_es: 'Liberia', name_en: 'Liberia', code: '231', alpha_2: 'LR', alpha_3: 'LBR' },
    { continent: 'Africa', name_es: 'Libia', name_en: 'Libya', code: '218', alpha_2: 'LY', alpha_3: 'LBY' },
    { continent: 'Europa', name_es: 'Liechtenstein', name_en: 'Liechtenstein', code: '423', alpha_2: 'LI', alpha_3: 'LIE' },
    { continent: 'Europa', name_es: 'Lituania', name_en: 'Lithuania', code: '370', alpha_2: 'LT', alpha_3: 'LTU' },
    { continent: 'Europa', name_es: 'luxemburgo', name_en: 'Luxembourg', code: '352', alpha_2: 'LU', alpha_3: 'LUX' },
    { continent: 'Asia', name_es: 'Macao', name_en: 'Macau', code: '853', alpha_2: 'MO', alpha_3: 'MAC' },
    { continent: 'Europa', name_es: 'macedonia', name_en: 'Macedonia', code: '389', alpha_2: 'MK', alpha_3: 'MKD' },
    { continent: 'Africa', name_es: 'Madagascar', name_en: 'Madagascar', code: '261', alpha_2: 'MG', alpha_3: 'MDG' },
    { continent: 'Africa', name_es: 'Malaui', name_en: 'Malawi', code: '265', alpha_2: 'MW', alpha_3: 'MWI' },
    { continent: 'Asia', name_es: 'Malasia', name_en: 'Malaysia', code: '60', alpha_2: 'MY', alpha_3: 'MYS' },
    { continent: 'Asia', name_es: 'Maldivas', name_en: 'Maldives', code: '960', alpha_2: 'MV', alpha_3: 'MDV' },
    { continent: 'Africa', name_es: 'Malí', name_en: 'Mali', code: '223', alpha_2: 'ML', alpha_3: 'MLI' },
    { continent: 'Europa', name_es: 'Malta', name_en: 'Malta', code: '356', alpha_2: 'MT', alpha_3: 'MLT' },
    { continent: 'Oceania', name_es: 'Islas Marshall', name_en: 'Marshall Islands', code: '692', alpha_2: 'MH', alpha_3: 'MHL' },
    { continent: 'Africa', name_es: 'Mauritania', name_en: 'Mauritania', code: '222', alpha_2: 'MR', alpha_3: 'MRT' },
    { continent: 'Africa', name_es: 'Mauricio', name_en: 'Mauritius', code: '230', alpha_2: 'MU', alpha_3: 'MUS' },
    { continent: 'Africa', name_es: 'Mayotte', name_en: 'Mayotte', code: '262', alpha_2: 'YT', alpha_3: 'MYT' },
    { continent: 'America', sub_continent: 'North America', name_es: 'México', name_en: 'Mexico', code: '52', alpha_2: 'MX', alpha_3: 'MEX' },
    { continent: 'Oceania', name_es: 'Micronesia', name_en: 'Micronesia', code: '691', alpha_2: 'FM', alpha_3: 'FSM' },
    { continent: 'Europa', name_es: 'Moldavia', name_en: 'Moldova', code: '373', alpha_2: 'MD', alpha_3: 'MDA' },
    { continent: 'Europa', name_es: 'Mónaco', name_en: 'Monaco', code: '377', alpha_2: 'MC', alpha_3: 'MCO' },
    { continent: 'Asia', name_es: 'Mongolia', name_en: 'Mongolia', code: '976', alpha_2: 'MN', alpha_3: 'MNG' },
    { continent: 'Europa', name_es: 'montenegro', name_en: 'Montenegro', code: '382', alpha_2: 'ME', alpha_3: 'MNE' },
    { continent: 'America', sub_continent: 'North America', name_es: 'Montserrat', name_en: 'Montserrat', code: '1-664', alpha_2: 'MS', alpha_3: 'MSR' },
    { continent: 'Africa', name_es: 'Marruecos', name_en: 'Morocco', code: '212', alpha_2: 'MA', alpha_3: 'MAR' },
    { continent: 'Africa', name_es: 'Mozambique', name_en: 'Mozambique', code: '258', alpha_2: 'MZ', alpha_3: 'MOZ' },
    { continent: 'Asia', name_es: 'Birmania', name_en: 'Myanmar', code: '95', alpha_2: 'MM', alpha_3: 'MMR' },
    { continent: 'Africa', name_es: 'Namibia', name_en: 'Namibia', code: '264', alpha_2: 'NA', alpha_3: 'NAM' },
    { continent: 'Oceania', name_es: 'Nauru', name_en: 'Nauru', code: '674', alpha_2: 'NR', alpha_3: 'NRU' },
    { continent: 'Asia', name_es: 'Nepal', name_en: 'Nepal', code: '977', alpha_2: 'NP', alpha_3: 'NPL' },
    { continent: 'Europa', name_es: 'Países Bajos', name_en: 'Netherlands', code: '31', alpha_2: 'NL', alpha_3: 'NLD' },
    { continent: 'America', sub_continent: 'North America', name_es: 'Antillas Holandesas', name_en: 'Netherlands Antilles', code: '599', alpha_2: 'AN', alpha_3: 'ANT' },
    { continent: 'Oceania', name_es: 'Nueva Caledonia', name_en: 'New Caledonia', code: '687', alpha_2: 'NC', alpha_3: 'NCL' },
    { continent: 'Oceania', name_es: 'Nueva Zelanda', name_en: 'New Zealand', code: '64', alpha_2: 'NZ', alpha_3: 'NZL' },
    { continent: 'America', sub_continent: 'North America', name_es: 'Nicaragua', name_en: 'Nicaragua', code: '505', alpha_2: 'NI', alpha_3: 'NIC' },
    { continent: 'Africa', name_es: 'Níger', name_en: 'Niger', code: '227', alpha_2: 'NE', alpha_3: 'NER' },
    { continent: 'Africa', name_es: 'Nigeria', name_en: 'Nigeria', code: '234', alpha_2: 'NG', alpha_3: 'NGA' },
    { continent: 'Oceania', name_es: 'Niue', name_en: 'Niue', code: '683', alpha_2: 'NU', alpha_3: 'NIU' },
    { continent: 'Asia', name_es: 'Corea del Norte', name_en: 'North Korea', code: '850', alpha_2: 'KP', alpha_3: 'PRK' },
    { continent: 'Oceania', name_es: 'Islas Marianas del Norte', name_en: 'Northern Mariana Islands', code: '1-670', alpha_2: 'MP', alpha_3: 'MNP' },
    { continent: 'Europa', name_es: 'Noruega', name_en: 'Norway', code: '47', alpha_2: 'NO', alpha_3: 'NOR' },
    { continent: 'Asia', name_es: 'Omán', name_en: 'Oman', code: '968', alpha_2: 'OM', alpha_3: 'OMN' },
    { continent: 'Asia', name_es: 'Pakistán', name_en: 'Pakistan', code: '92', alpha_2: 'PK', alpha_3: 'PAK' },
    { continent: 'Oceania', name_es: 'palaos', name_en: 'Palau', code: '680', alpha_2: 'PW', alpha_3: 'PLW' },
    { continent: 'Asia', name_es: 'Palestina', name_en: 'Palestine', code: '970', alpha_2: 'PS', alpha_3: 'PSE' },
    { continent: 'America', sub_continent: 'North America', name_es: 'Panamá', name_en: 'Panama', code: '507', alpha_2: 'PA', alpha_3: 'PAN' },
    { continent: 'Oceania', name_es: 'Papúa Nueva Guinea', name_en: 'Papua New Guinea', code: '675', alpha_2: 'PG', alpha_3: 'PNG' },
    { continent: 'America', sub_continent: 'South America', name_es: 'Paraguay', name_en: 'Paraguay', code: '595', alpha_2: 'PY', alpha_3: 'PRY' },
    { continent: 'America', sub_continent: 'South America', name_es: 'Perú', name_en: 'Peru', code: '51', alpha_2: 'PE', alpha_3: 'PER' },
    { continent: 'Asia', name_es: 'Filipinas', name_en: 'Philippines', code: '63', alpha_2: 'PH', alpha_3: 'PHL' },
    { continent: 'Oceania', name_es: 'Islas Pitcairn', name_en: 'Pitcairn Islands', code: '64', alpha_2: 'PN', alpha_3: 'PCN' },
    { continent: 'Europa', name_es: 'Polonia', name_en: 'Poland', code: '48', alpha_2: 'PL', alpha_3: 'POL' },
    { continent: 'Europa', name_es: 'Portugal', name_en: 'Portugal', code: '351', alpha_2: 'PT', alpha_3: 'PRT' },
    { continent: 'America', sub_continent: 'North America', name_es: 'Puerto Rico', name_en: 'Puerto Rico', code: '1-787', alpha_2: 'PR', alpha_3: 'PRI' },
    { continent: 'Asia', name_es: 'Katar', name_en: 'Qatar', code: '974', alpha_2: 'QA', alpha_3: 'QAT' },
    { continent: 'Africa', name_es: 'República del Congo', name_en: 'Republic of the Congo', code: '242', alpha_2: 'CG', alpha_3: 'COG' },
    { continent: 'Africa', name_es: 'Reunión', name_en: 'Reunion', code: '262', alpha_2: 'RE', alpha_3: 'REU' },
    { continent: 'Europa', name_es: 'Rumania', name_en: 'Romania', code: '40', alpha_2: 'RO', alpha_3: 'ROU' },
    { continent: 'Europa', sub_continent: 'Asia', name_es: 'Rusia', name_en: 'Russia', code: '7', alpha_2: 'RU', alpha_3: 'RUS' },
    { continent: 'Africa', name_es: 'Ruanda', name_en: 'Rwanda', code: '250', alpha_2: 'RW', alpha_3: 'RWA' },
    { continent: 'America', sub_continent: 'North America', name_es: 'San Bartolomé', name_en: 'Saint Barthelemy', code: '590', alpha_2: 'BL', alpha_3: 'BLM' },
    { continent: 'Africa', name_es: 'Santa Elena', name_en: 'Saint Helena', code: '290', alpha_2: 'SH', alpha_3: 'SHN' },
    { continent: 'America', sub_continent: 'North America', name_es: 'San Cristóbal y Nieves', name_en: 'Saint Kitts and Nevis', code: '1-869', alpha_2: 'KN', alpha_3: 'KNA' },
    { continent: 'America', sub_continent: 'North America', name_es: 'Santa Lucía', name_en: 'Saint Lucia', code: '1-758', alpha_2: 'LC', alpha_3: 'LCA' },
    { continent: 'America', sub_continent: 'North America', name_es: 'San Martín', name_en: 'Saint Martin', code: '590', alpha_2: 'MF', alpha_3: 'MAF' },
    { continent: 'America', sub_continent: 'North America', name_es: 'San Pedro y Miquelón', name_en: 'Saint Pierre and Miquelon', code: '508', alpha_2: 'PM', alpha_3: 'SPM' },
    { continent: 'America', sub_continent: 'North America', name_es: 'San Vicente y las Granadinas', name_en: 'Saint Vincent and the Grenadines', code: '1-784', alpha_2: 'VC', alpha_3: 'VCT' },
    { continent: 'Oceania', name_es: 'samoa', name_en: 'Samoa', code: '685', alpha_2: 'WS', alpha_3: 'WSM' },
    { continent: 'Europa', name_es: 'San Marino', name_en: 'San Marino', code: '378', alpha_2: 'SM', alpha_3: 'SMR' },
    { continent: 'Africa', name_es: 'Santo Tomé y Príncipe', name_en: 'Sao Tome and Principe', code: '239', alpha_2: 'ST', alpha_3: 'STP' },
    { continent: 'Asia', name_es: 'Arabia Saudita', name_en: 'Saudi Arabia', code: '966', alpha_2: 'SA', alpha_3: 'SAU' },
    { continent: 'Africa', name_es: 'Senegal', name_en: 'Senegal', code: '221', alpha_2: 'SN', alpha_3: 'SEN' },
    { continent: 'Europa', name_es: 'Serbia', name_en: 'Serbia', code: '381', alpha_2: 'RS', alpha_3: 'SRB' },
    { continent: 'Africa', name_es: 'Seychelles', name_en: 'Seychelles', code: '248', alpha_2: 'SC', alpha_3: 'SYC' },
    { continent: 'Africa', name_es: 'Sierra Leona', name_en: 'Sierra Leone', code: '232', alpha_2: 'SL', alpha_3: 'SLE' },
    { continent: 'Asia', name_es: 'Singapur', name_en: 'Singapore', code: '65', alpha_2: 'SG', alpha_3: 'SGP' },
    { continent: 'Europa', name_es: 'San Martín', name_en: 'Sint Maarten', code: '1-721', alpha_2: 'SX', alpha_3: 'SXM' },
    { continent: 'Europa', name_es: 'Eslovaquia', name_en: 'Slovakia', code: '421', alpha_2: 'SK', alpha_3: 'SVK' },
    { continent: 'Oceania', name_es: 'Eslovenia', name_en: 'Slovenia', code: '386', alpha_2: 'SI', alpha_3: 'SVN' },
    { continent: 'Africa', name_es: 'Islas Salomón', name_en: 'Solomon Islands', code: '677', alpha_2: 'SB', alpha_3: 'SLB' },
    { continent: 'Africa', name_es: 'Somalia', name_en: 'Somalia', code: '252', alpha_2: 'SO', alpha_3: 'SOM' },
    { continent: 'Asia', name_es: 'Sudáfrica', name_en: 'South Africa', code: '27', alpha_2: 'ZA', alpha_3: 'ZAF' },
    { continent: 'Africa', name_es: 'Corea del Sur', name_en: 'South Korea', code: '82', alpha_2: 'KR', alpha_3: 'KOR' },
    { continent: 'Europa', name_es: 'Sudán del Sur', name_en: 'South Sudan', code: '211', alpha_2: 'SS', alpha_3: 'SSD' },
    { continent: 'Asia', name_es: 'España', name_en: 'Spain', code: '34', alpha_2: 'ES', alpha_3: 'ESP' },
    { continent: 'Africa', name_es: 'Sri Lanka', name_en: 'Sri Lanka', code: '94', alpha_2: 'LK', alpha_3: 'LKA' },
    { continent: 'America', sub_continent: 'South America', name_es: 'Sudán', name_en: 'Sudan', code: '249', alpha_2: 'SD', alpha_3: 'SDN' },
    { continent: 'Europa', name_es: 'Surinam', name_en: 'Suriname', code: '597', alpha_2: 'SR', alpha_3: 'SUR' },
    { continent: 'Africa', name_es: 'Svalbard y Jan Mayen', name_en: 'Svalbard and Jan Mayen', code: '47', alpha_2: 'SJ', alpha_3: 'SJM' },
    { continent: 'Europa', name_es: 'Suazilandia', name_en: 'Swaziland', code: '268', alpha_2: 'SZ', alpha_3: 'SWZ' },
    { continent: 'Europa', name_es: 'Suecia', name_en: 'Sweden', code: '46', alpha_2: 'SE', alpha_3: 'SWE' },
    { continent: 'Asia', name_es: 'Suiza', name_en: 'Switzerland', code: '41', alpha_2: 'CH', alpha_3: 'CHE' },
    { continent: 'Asia', name_es: 'Siria', name_en: 'Syria', code: '963', alpha_2: 'SY', alpha_3: 'SYR' },
    { continent: 'Asia', name_es: 'Taiwán', name_en: 'Taiwan', code: '886', alpha_2: 'TW', alpha_3: 'TWN' },
    { continent: 'Africa', name_es: 'Tayikistán', name_en: 'Tajikistan', code: '992', alpha_2: 'TJ', alpha_3: 'TJK' },
    { continent: 'Asia', name_es: 'Tanzania', name_en: 'Tanzania', code: '255', alpha_2: 'TZ', alpha_3: 'TZA' },
    { continent: 'Asia', name_es: 'Tailandia', name_en: 'Thailand', code: '66', alpha_2: 'TH', alpha_3: 'THA' },
    { continent: 'Africa', name_es: 'Ir', name_en: 'Togo', code: '228', alpha_2: 'TG', alpha_3: 'TGO' },
    { continent: 'Oceania', name_es: 'Tokelau', name_en: 'Tokelau', code: '690', alpha_2: 'TK', alpha_3: 'TKL' },
    { continent: 'Oceania', name_es: 'tonga', name_en: 'Tonga', code: '676', alpha_2: 'TO', alpha_3: 'TON' },
    { continent: 'America', sub_continent: 'North America', name_es: 'Trinidad y Tobago', name_en: 'Trinidad and Tobago', code: '1-868', alpha_2: 'TT', alpha_3: 'TTO' },
    { continent: 'Africa', name_es: 'Túnez', name_en: 'Tunisia', code: '216', alpha_2: 'TN', alpha_3: 'TUN' },
    { continent: 'Asia', sub_continent: "Europa", name_es: 'Pavo', name_en: 'Turkey', code: '90', alpha_2: 'TR', alpha_3: 'TUR' },
    { continent: 'Asia', name_es: 'turkmenistán', name_en: 'Turkmenistan', code: '993', alpha_2: 'TM', alpha_3: 'TKM' },
    { continent: 'America', sub_continent: 'North America', name_es: 'Islas Turcas y Caicos', name_en: 'Turks and Caicos Islands', code: '1-649', alpha_2: 'TC', alpha_3: 'TCA' },
    { continent: 'Oceania', name_es: 'Tuvalu', name_en: 'Tuvalu', code: '688', alpha_2: 'TV', alpha_3: 'TUV' },
    { continent: 'America', sub_continent: 'North America', name_es: 'Islas Vírgenes de EE.UU', name_en: 'U.S. Virgin Islands', code: '1-340', alpha_2: 'VI', alpha_3: 'VIR' },
    { continent: 'Africa', name_es: 'Uganda', name_en: 'Uganda', code: '256', alpha_2: 'UG', alpha_3: 'UGA' },
    { continent: 'Europa', name_es: 'Ucrania', name_en: 'Ukraine', code: '380', alpha_2: 'UA', alpha_3: 'UKR' },
    { continent: 'Asia', name_es: 'Emiratos Árabes Unidos', name_en: 'United Arab Emirates', code: '971', alpha_2: 'AE', alpha_3: 'ARE' },
    { continent: 'Europa', name_es: 'Reino Unido', name_en: 'United Kingdom', code: '44', alpha_2: 'GB', alpha_3: 'GBR' },
    { continent: 'America', sub_continent: 'North America', name_es: 'Estados Unidos', name_en: 'United States', code: '1', alpha_2: 'US', alpha_3: 'USA' },
    { continent: 'America', sub_continent: 'South America', name_es: 'Uruguay', name_en: 'Uruguay', code: '598', alpha_2: 'UY', alpha_3: 'URY' },
    { continent: 'Asia', name_es: 'Uzbekistán', name_en: 'Uzbekistan', code: '998', alpha_2: 'UZ', alpha_3: 'UZB' },
    { continent: 'Oceania', name_es: 'Vanuatu', name_en: 'Vanuatu', code: '678', alpha_2: 'VU', alpha_3: 'VUT' },
    { continent: 'Europa', name_es: 'Vaticano', name_en: 'Vatican', code: '379', alpha_2: 'VA', alpha_3: 'VAT' },
    { continent: 'America', sub_continent: 'South America', name_es: 'Venezuela', name_en: 'Venezuela', code: '58', alpha_2: 'VE', alpha_3: 'VEN' },
    { continent: 'Asia', name_es: 'Vietnam', name_en: 'Vietnam', code: '84', alpha_2: 'VN', alpha_3: 'VNM' },
    { continent: 'Oceania', name_es: 'Wallis y Futuna', name_en: 'Wallis and Futuna', code: '681', alpha_2: 'WF', alpha_3: 'WLF' },
    { continent: 'Africa', name_es: 'Sahara Occidental', name_en: 'Western Sahara', code: '212', alpha_2: 'EH', alpha_3: 'ESH' },
    { continent: 'Asia', name_es: 'Yemen', name_en: 'Yemen', code: '967', alpha_2: 'YE', alpha_3: 'YEM' },
    { continent: 'Africa', name_es: 'Zambia', name_en: 'Zambia', code: '260', alpha_2: 'ZM', alpha_3: 'ZMB' },
    { continent: 'Africa', name_es: 'Zimbabue', name_en: 'Zimbabwe', code: '263', alpha_2: 'ZW', alpha_3: 'ZWE' }
])