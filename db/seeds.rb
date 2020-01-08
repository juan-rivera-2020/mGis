# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

regions_countries = [
  { "name" => "Aruba", "code": "ABW" , "region_type" => "country", "center" => "[12.52111, -69.968338]" },
  { "name" => "Afghanistan", "code" => "AFG", "region_type" => "country", "center" => "[33.93911, 67.709953]" },
  { "name" => "Angola", "code" => "AGO", "region_type" => "country", "center" => "[-11.202692, 17.873887]" },
  { "name" => "Anguilla", "code" => "AIA", "region_type" => "country", "center" => "[18.220554, -63.068615]" },
  { "name" => "Albania", "code" => "ALB", "region_type" => "country", "center" => "[41.153332, 20.168331]" },
  { "name" => "Aland", "code" => "ALA", "region_type" => "country", "center" => "[60.178524, 19.915609]" },
  { "name" => "Andorra", "code" => "AND", "region_type" => "country", "center" => "[42.546245, 1.601554]" },
  { "name" => "United Arab Emirates", "code" => "ARE", "region_type" => "country", "center" => "[23.424076, 53.847818]" },
  { "name" => "Argentina", "code" => "ARG", "region_type" => "country", "center" => "[-38.416097, -63.616672]" },
  { "name" => "Armenia", "code" => "ARM", "region_type" => "country", "center" => "[40.069099, 45.038189]" },
  { "name" => "American Samoa", "code" => "ASM", "region_type" => "country", "center" => "[-14.270972, -170.132217]" },
  { "name" => "Antarctica", "code" => "ATA", "region_type" => "country", "center" => "[-75.250973, -0.071389]" },
  { "name" => "French Southern and Antarctic Lands", "code" => "ATF", "region_type" => "country", "center" => "[42.012039, -75.305542]" },
  { "name" => "Antigua and Barbuda", "code" => "ATG", "region_type" => "country", "center" => "[17.060816, -61.796428]" },
  { "name" => "Australia", "code" => "AUS", "region_type" => "country", "center" => "[-25.274398, 133.775136]" },
  { "name" => "Austria", "code" => "AUT", "region_type" => "country", "center" => "[47.516231, 14.550072]" },
  { "name" => "Azerbaijan", "code" => "AZE", "region_type" => "country", "center" => "[40.143105, 47.576927]" },
  { "name" => "Burundi", "code" => "BDI", "region_type" => "country", "center" => "[-3.373056, 29.918886]" },
  { "name" => "Belgium", "code" => "BEL", "region_type" => "country", "center" => "[50.503887, 4.469936]" },
  { "name" => "Benin", "code" => "BEN", "region_type" => "country", "center" => "[9.30769, 2.315834]" },
  { "name" => "Burkina Faso", "code" => "BFA", "region_type" => "country", "center" => "[12.238333, -1.561593]" },
  { "name" => "Bangladesh", "code" => "BGD", "region_type" => "country", "center" => "[23.684994, 90.356331]" },
  { "name" => "Bulgaria", "code" => "BGR", "region_type" => "country", "center" => "[42.733883, 25.48583]" },
  { "name" => "Bahrain", "code" => "BHR", "region_type" => "country", "center" => "[25.930414, 50.637772]" },
  { "name" => "The Bahamas", "code" => "BHS", "region_type" => "country", "center" => "[25.03428, -77.39628]" },
  { "name" => "Bosnia and Herzegovina", "code" => "BIH", "region_type" => "country", "center" => "[43.915886, 17.679076]" },
  { "name" => "Saint Barthelemy", "code" => "BLM", "region_type" => "country", "center" => "[17.900000, -62.833332]" },
  { "name" => "Belarus", "code" => "BLR", "region_type" => "country", "center" => "[53.709807, 27.953389]" },
  { "name" => "Belize", "code" => "BLZ", "region_type" => "country", "center" => "[17.189877, -88.49765]" },
  { "name" => "Bermuda", "code" => "BMU", "region_type" => "country", "center" => "[32.321384, -64.75737]" },
  { "name" => "Bolivia", "code" => "BOL", "region_type" => "country", "center" => "[-16.290154, -63.588653]" },
  { "name" => "Brazil", "code" => "BRA", "region_type" => "country", "center" => "[-14.235004, -51.92528]" },
  { "name" => "Barbados", "code" => "BRB", "region_type" => "country", "center" => "[13.193887, -59.543198]" },
  { "name" => "Brunei", "code" => "BRN", "region_type" => "country", "center" => "[4.535277, 114.727669]" },
  { "name" => "Bhutan", "code" => "BTN", "region_type" => "country", "center" => "[27.514162, 90.433601]" },
  { "name" => "Botswana", "code" => "BWA", "region_type" => "country", "center" => "[-22.328474, 24.684866]" },
  { "name" => "Central African Republic", "code" => "CAF", "region_type" => "country", "center" => "[6.611111, 20.939444]" },
  { "name" => "Canada", "code" => "CAN", "region_type" => "country", "center" => "[56.130366, -106.346771]" },
  { "name" => "Switzerland", "code" => "CHE", "region_type" => "country", "center" => "[46.818188, 8.227512]" },
  { "name" => "Chile", "code" => "CHL", "region_type" => "country", "center" => "[-35.675147, -71.542969]" },
  { "name" => "China", "code" => "CHN", "region_type" => "country", "center" => "[35.86166, 104.195397]" },
  { "name" => "Ivory Coast", "code" => "CIV", "region_type" => "country", "center" => "[46.912960, 5.858800]" },
  { "name" => "Cameroon", "code" => "CMR", "region_type" => "country", "center" => "[7.369722, 12.354722]" },
  { "name" => "Democratic Republic of the Congo", "code" => "COD", "region_type" => "country", "center" => "[-4.038333, 21.758663]" },
  { "name" => "Republic of Congo", "code" => "COG", "region_type" => "country", "center" => "[-4.321530, 15.311850]" },
  { "name" => "Cook Islands", "code" => "COK", "region_type" => "country", "center" => "[-21.236736, -159.777671]" },
  { "name" => "Colombia", "code" => "COL", "region_type" => "country", "center" => "[4.570868, -74.297333]" },
  { "name" => "Comoros", "code" => "COM", "region_type" => "country", "center" => "[-11.875001, 43.872219]" },
  { "name" => "Cape Verde", "code" => "CPV", "region_type" => "country", "center" => "[16.002082, -24.013197]" },
  { "name" => "Costa Rica", "code" => "CRI", "region_type" => "country", "center" => "[9.748917, -83.753428]" },
  { "name" => "Cuba", "code" => "CUB", "region_type" => "country", "center" => "[21.521757, -77.781167]" },
  { "name" => "Curaçao", "code" => "CUW", "region_type" => "country", "center" => "[12.121610, -68.949417]" },
  { "name" => "Cayman Islands", "code" => "CYM", "region_type" => "country", "center" => "[19.513469, -80.566956]" },
  { "name" => "Cyprus", "code" => "CYP", "region_type" => "country", "center" => "[35.126413, 33.429859]" },
  { "name" => "Czech Republic", "code" => "CZE", "region_type" => "country", "center" => "[49.817492, 15.472962]" },
  { "name" => "Germany", "code" => "DEU", "region_type" => "country", "center" => "[51.165691, 10.451526]" },
  { "name" => "Djibouti", "code" => "DJI", "region_type" => "country", "center" => "[11.825138, 42.590275]" },
  { "name" => "Dominica", "code" => "DMA", "region_type" => "country", "center" => "[15.414999, -61.370976]" },
  { "name" => "Denmark", "code" => "DNK", "region_type" => "country", "center" => "[56.26392, 9.501785]" },
  { "name" => "Dominican Republic", "code" => "DOM", "region_type" => "country", "center" => "[18.735693, -70.162651]" },
  { "name" => "Algeria", "code" => "DZA", "region_type" => "country", "center" => "[28.033886, 1.659626]" },
  { "name" => "Ecuador", "code" => "ECU", "region_type" => "country", "center" => "[-1.831239, -78.183406]" },
  { "name" => "Egypt", "code" => "EGY", "region_type" => "country", "center" => "[26.820553, 30.802498]" },
  { "name" => "Eritrea", "code" => "ERI", "region_type" => "country", "center" => "[15.179384, 39.782334]" },
  { "name" => "Spain", "code" => "ESP", "region_type" => "country", "center" => "[40.463667, -3.74922]" },
  { "name" => "Estonia", "code" => "EST", "region_type" => "country", "center" => "[58.595272, 25.013607]" },
  { "name" => "Ethiopia", "code" => "ETH", "region_type" => "country", "center" => "[9.145, 40.489673]" },
  { "name" => "Finland", "code" => "FIN", "region_type" => "country", "center" => "[61.92411, 25.748151]" },
  { "name" => "Fiji", "code" => "FJI", "region_type" => "country", "center" => "[-16.578193, 179.414413]" },
  { "name" => "Falkland Islands", "code" => "FLK", "region_type" => "country", "center" => "[-51.796253, -59.523613]" },
  { "name" => "France", "code" => "FRA", "region_type" => "country", "center" => "[46.227638, 2.213749]" },
  { "name" => "Faroe Islands", "code" => "FRO", "region_type" => "country", "center" => "[61.892635, -6.911806]" },
  { "name" => "Federated States of Micronesia", "code" => "FSM", "region_type" => "country", "center" => "[6.916640, 158.149970]" },
  { "name" => "Gabon", "code" => "GAB", "region_type" => "country", "center" => "[-0.803689, 11.609444]" },
  { "name" => "United Kingdom", "code" => "GBR", "region_type" => "country", "center" => "[55.378051, -3.435973]" },
  { "name" => "Georgia", "code" => "GEO", "region_type" => "country", "center" => "[42.315407, 43.356892]" },
  { "name" => "Guernsey", "code" => "GGY", "region_type" => "country", "center" => "[49.465691, -2.585278]" },
  { "name" => "Ghana", "code" => "GHA", "region_type" => "country", "center" => "[7.946527, -1.023194]" },
  { "name" => "Gibraltar", "code" => "GIB", "region_type" => "country", "center" => "[36.137741, -5.345374]" },
  { "name" => "Guinea", "code" => "GIN", "region_type" => "country", "center" => "[9.945587, -9.696645]" },
  { "name" => "Gambia", "code" => "GMB", "region_type" => "country", "center" => "[13.443182, -15.310139]" },
  { "name" => "Guinea Bissau", "code" => "GNB", "region_type" => "country", "center" => "[11.803749, -15.180413]" },
  { "name" => "Equatorial Guinea", "code" => "GNQ", "region_type" => "country", "center" => "[1.650801, 10.267895]" },
  { "name" => "Greece", "code" => "GRC", "region_type" => "country", "center" => "[39.074208, 21.824312]" },
  { "name" => "Grenada", "code" => "GRD", "region_type" => "country", "center" => "[12.262776, -61.604171]" },
  { "name" => "Greenland", "code" => "GRL", "region_type" => "country", "center" => "[71.706936, -42.604303]" },
  { "name" => "Guatemala", "code" => "GTM", "region_type" => "country", "center" => "[15.783471, -90.230759]" },
  { "name" => "Guam", "code" => "GUM", "region_type" => "country", "center" => "[13.444304, 144.793731]" },
  { "name" => "Guyana", "code" => "GUY", "region_type" => "country", "center" => "[4.860416, -58.93018]" },
  { "name" => "Hong Kong S.A.R.", "code" => "HKG", "region_type" => "country", "center" => "[22.396428, 114.109497]" },
  { "name" => "Heard Island and McDonald Islands", "code" => "HMD", "region_type" => "country", "center" => "[-53.08181, 73.504158]" },
  { "name" => "Honduras", "code" => "HND", "region_type" => "country", "center" => "[15.199999, -86.241905]" },
  { "name" => "Croatia", "code" => "HRV", "region_type" => "country", "center" => "[45.1, 15.2]" },
  { "name" => "Haiti", "code" => "HTI", "region_type" => "country", "center" => "[18.971187, -72.285215]" },
  { "name" => "Hungary", "code" => "HUN", "region_type" => "country", "center" => "[47.162494, 19.503304]" },
  { "name" => "Indonesia", "code" => "IDN", "region_type" => "country", "center" => "[-0.789275, 113.921327]" },
  { "name" => "Isle of Man", "code" => "IMN", "region_type" => "country", "center" => "[54.236107, -4.548056]" },
  { "name" => "India", "code" => "IND", "region_type" => "country", "center" => "[20.593684, 78.96288]" },
  { "name" => "British Indian Ocean Territory", "code" => "IOT", "region_type" => "country", "center" => "[-6.343194, 71.876519]" },
  { "name" => "Ireland", "code" => "IRL", "region_type" => "country", "center" => "[53.41291, -8.24389]" },
  { "name" => "Iran", "code" => "IRN", "region_type" => "country", "center" => "[32.427908, 53.688046]" },
  { "name" => "Iraq", "code" => "IRQ", "region_type" => "country", "center" => "[33.223191, 43.679291]" },
  { "name" => "Iceland", "code" => "ISL", "region_type" => "country", "center" => "[64.963051, -19.020835]" },
  { "name" => "Israel", "code" => "ISR", "region_type" => "country", "center" => "[31.046051, 34.851612]" },
  { "name" => "Italy", "code" => "ITA", "region_type" => "country", "center" => "[41.87194, 12.56738]" },
  { "name" => "Jamaica", "code" => "JAM", "region_type" => "country", "center" => "[18.109581, -77.297508]" },
  { "name" => "Jersey", "code" => "JEY", "region_type" => "country", "center" => "[49.214439, -2.13125]" },
  { "name" => "Jordan", "code" => "JOR", "region_type" => "country", "center" => "[30.585164, 36.238414]" },
  { "name" => "Japan", "code" => "JPN", "region_type" => "country", "center" => "[36.204824, 138.252924]" },
  { "name" => "Kazakhstan", "code" => "KAZ", "region_type" => "country", "center" => "[48.019573, 66.923684]" },
  { "name" => "Kenya", "code" => "KEN", "region_type" => "country", "center" => "[-0.023559, 37.906193]" },
  { "name" => "Kyrgyzstan", "code" => "KGZ", "region_type" => "country", "center" => "[41.20438, 74.766098]" },
  { "name" => "Cambodia", "code" => "KHM", "region_type" => "country", "center" => "[12.565679, 104.990963]" },
  { "name" => "Kiribati", "code" => "KIR", "region_type" => "country", "center" => "[-3.370417, -168.734039]" },
  { "name" => "Saint Kitts and Nevis", "code" => "KNA", "region_type" => "country", "center" => "[17.357822, -62.782998]" },
  { "name" => "South Korea", "code" => "KOR", "region_type" => "country", "center" => "[35.907757, 127.766922]" },
  { "name" => "Kuwait", "code" => "KWT", "region_type" => "country", "center" => "[29.31166, 47.481766]" },
  { "name" => "Laos", "code" => "LAO", "region_type" => "country", "center" => "[19.85627, 102.495496]" },
  { "name" => "Lebanon", "code" => "LBN", "region_type" => "country", "center" => "[33.854721, 35.862285]" },
  { "name" => "Liberia", "code" => "LBR", "region_type" => "country", "center" => "[6.428055, -9.429499]" },
  { "name" => "Libya", "code" => "LBY", "region_type" => "country", "center" => "[26.3351, 17.228331]" },
  { "name" => "Saint Lucia", "code" => "LCA", "region_type" => "country", "center" => "[13.909444, -60.978893]" },
  { "name" => "Liechtenstein", "code" => "LIE", "region_type" => "country", "center" => "[47.166, 9.555373]" },
  { "name" => "Sri Lanka", "code" => "LKA", "region_type" => "country", "center" => "[7.873054, 80.771797]" },
  { "name" => "Lesotho", "code" => "LSO", "region_type" => "country", "center" => "[-29.609988, 28.233608]" },
  { "name" => "Lithuania", "code" => "LTU", "region_type" => "country", "center" => "[55.169438, 23.881275]" },
  { "name" => "Luxembourg", "code" => "LUX", "region_type" => "country", "center" => "[49.815273, 6.129583]" },
  { "name" => "Latvia", "code" => "LVA", "region_type" => "country", "center" => "[56.879635, 24.603189]" },
  { "name" => "Saint Martin", "code" => "MAF", "region_type" => "country", "center" => "[18.069000, -63.085239]" },
  { "name" => "Morocco", "code" => "MAR", "region_type" => "country", "center" => "[31.791702, -7.09262]" },
  { "name" => "Monaco", "code" => "MCO", "region_type" => "country", "center" => "[43.750298, 7.412841]" },
  { "name" => "Moldova", "code" => "MDA", "region_type" => "country", "center" => "[47.411631, 28.369885]" },
  { "name" => "Madagascar", "code" => "MDG", "region_type" => "country", "center" => "[-18.766947, 46.869107]" },
  { "name" => "Maldives", "code" => "MDV", "region_type" => "country", "center" => "[3.202778, 73.22068]" },
  { "name" => "Mexico", "code" => "MEX", "region_type" => "country", "center" => "[23.634501, -102.552784]" },
  { "name" => "Marshall Islands", "code" => "MHL", "region_type" => "country", "center" => "[7.131474, 171.184478]" },
  { "name" => "Macedonia", "code" => "MKD", "region_type" => "country", "center" => "[41.608635, 21.745275]" },
  { "name" => "Mali", "code" => "MLI", "region_type" => "country", "center" => "[17.570692, -3.996166]" },
  { "name" => "Malta", "code" => "MLT", "region_type" => "country", "center" => "[35.937496, 14.375416]" },
  { "name" => "Myanmar", "code" => "MMR", "region_type" => "country", "center" => "[21.913965, 95.956223]" },
  { "name" => "Montenegro", "code" => "MNE", "region_type" => "country", "center" => "[42.708678, 19.37439]" },
  { "name" => "Mongolia", "code" => "MNG", "region_type" => "country", "center" => "[46.862496, 103.846656]" },
  { "name" => "Northern Mariana Islands", "code" => "MNP", "region_type" => "country", "center" => "[17.33083, 145.38469]" },
  { "name" => "Mozambique", "code" => "MOZ", "region_type" => "country", "center" => "[-18.665695, 35.529562]" },
  { "name" => "Mauritania", "code" => "MRT", "region_type" => "country", "center" => "[21.00789, -10.940835]" },
  { "name" => "Montserrat", "code" => "MSR", "region_type" => "country", "center" => "[16.742498, -62.187366]" },
  { "name" => "Mauritius", "code" => "MUS", "region_type" => "country", "center" => "[-20.348404, 57.552152]" },
  { "name" => "Malawi", "code" => "MWI", "region_type" => "country", "center" => "[-13.254308, 34.301525]" },
  { "name" => "Malaysia", "code" => "MYS", "region_type" => "country", "center" => "[4.210484, 101.975766]" },
  { "name" => "Namibia", "code" => "NAM", "region_type" => "country", "center" => "[-22.95764, 18.49041]" },
  { "name" => "New Caledonia", "code" => "NCL", "region_type" => "country", "center" => "[-20.904305, 165.618042]" },
  { "name" => "Niger", "code" => "NER", "region_type" => "country", "center" => "[17.607789, 8.081666]" },
  { "name" => "Norfolk Island", "code" => "NFK", "region_type" => "country", "center" => "[-29.040835, 167.954712]" },
  { "name" => "Nigeria", "code" => "NGA", "region_type" => "country", "center" => "[9.081999, 8.675277]" },
  { "name" => "Nicaragua", "code" => "NIC", "region_type" => "country", "center" => "[12.865416, -85.207229]" },
  { "name" => "Niue", "code" => "NIU", "region_type" => "country", "center" => "[-19.054445, -169.867233]" },
  { "name" => "Netherlands", "code" => "NLD", "region_type" => "country", "center" => "[52.132633, 5.291266]" },
  { "name" => "Norway", "code" => "NOR", "region_type" => "country", "center" => "[60.472024, 8.468946]" },
  { "name" => "Nepal", "code" => "NPL", "region_type" => "country", "center" => "[28.394857, 84.124008]" },
  { "name" => "Nauru", "code" => "NRU", "region_type" => "country", "center" => "[-0.522778, 166.931503]" },
  { "name" => "New Zealand", "code" => "NZL", "region_type" => "country", "center" => "[-40.900557, 174.885971]" },
  { "name" => "Oman", "code" => "OMN", "region_type" => "country", "center" => "[21.512583, 55.923255]" },
  { "name" => "Pakistan", "code" => "PAK", "region_type" => "country", "center" => "[30.375321, 69.345116]" },
  { "name" => "Panama", "code" => "PAN", "region_type" => "country", "center" => "[8.537981, -80.782127]" },
  { "name" => "Pitcairn Islands", "code" => "PCN", "region_type" => "country", "center" => "[-24.703615, -127.439308]" },
  { "name" => "Peru", "code" => "PER", "region_type" => "country", "center" => "[-9.189967, -75.015152]" },
  { "name" => "Philippines", "code" => "PHL", "region_type" => "country", "center" => "[12.879721, 121.774017]" },
  { "name" => "Palau", "code" => "PLW", "region_type" => "country", "center" => "[7.51498, 134.58252]" },
  { "name" => "Papua New Guinea", "code" => "PNG", "region_type" => "country", "center" => "[-6.314993, 143.95555]" },
  { "name" => "Poland", "code" => "POL", "region_type" => "country", "center" => "[51.919438, 19.145136]" },
  { "name" => "Puerto Rico", "code" => "PRI", "region_type" => "country", "center" => "[18.220833, -66.590149]" },
  { "name" => "North Korea", "code" => "PRK", "region_type" => "country", "center" => "[40.339852, 127.510093]" },
  { "name" => "Portugal", "code" => "PRT", "region_type" => "country", "center" => "[39.399872, -8.224454]" },
  { "name" => "Paraguay", "code" => "PRY", "region_type" => "country", "center" => "[-23.442503, -58.443832]" },
  { "name" => "Palestine", "code" => "PSE", "region_type" => "country", "center" => "[31.952162, 35.233154]" },
  { "name" => "French Polynesia", "code" => "PYF", "region_type" => "country", "center" => "[-17.679742, -149.406843]" },
  { "name" => "Qatar", "code" => "QAT", "region_type" => "country", "center" => "[25.354826, 51.183884]" },
  { "name" => "Romania", "code" => "ROU", "region_type" => "country", "center" => "[45.943161, 24.96676]" },
  { "name" => "Russia", "code" => "RUS", "region_type" => "country", "center" => "[61.52401, 105.318756]" },
  { "name" => "Rwanda", "code" => "RWA", "region_type" => "country", "center" => "[-1.940278, 29.873888]" },
  { "name" => "Western Sahara", "code" => "ESH", "region_type" => "country", "center" => "[24.215527, -12.885834]" },
  { "name" => "Saudi Arabia", "code" => "SAU", "region_type" => "country", "center" => "[23.885942, 45.079162]" },
  { "name" => "Sudan", "code" => "SDN", "region_type" => "country", "center" => "[12.862807, 30.217636]" },
  { "name" => "Senegal", "code" => "SEN", "region_type" => "country", "center" => "[14.497401, -14.452362]" },
  { "name" => "Singapore", "code" => "SGP", "region_type" => "country", "center" => "[1.352083,  103.819836]" },
  { "name" => "South Georgia and South Sandwich Islands", "code" => "SGS", "region_type" => "country", "center" => "[-54.429581, -36.587910]" },
  { "name" => "Saint Helena", "code" => "SHN", "region_type" => "country", "center" => "[-24.143474, -10.030696]" },
  { "name" => "Solomon Islands", "code" => "SLB", "region_type" => "country", "center" => "[-9.64571, 160.156194]" },
  { "name" => "Sierra Leone", "code" => "SLE", "region_type" => "country", "center" => "[8.460555, -11.779889]" },
  { "name" => "El Salvador", "code" => "SLV", "region_type" => "country", "center" => "[13.794185, -88.89653]" },
  { "name" => "San Marino", "code" => "SMR", "region_type" => "country", "center" => "[43.94236, 12.457777]" },
  { "name" => "Somalia", "code" => "SOM", "region_type" => "country", "center" => "[5.152149, 46.199616]" },
  { "name" => "Saint Pierre and Miquelon", "code" => "SPM", "region_type" => "country", "center" => "[46.941936, -56.27111]" },
  { "name" => "Republic of Serbia", "code" => "SRB", "region_type" => "country", "center" => "[44.016521, 21.005859]" },
  { "name" => "Sao Tome and Principe", "code" => "STP", "region_type" => "country", "center" => "[0.18636, 6.613081]" },
  { "name" => "Suriname", "code" => "SUR", "region_type" => "country", "center" => "[3.919305, -56.027783]" },
  { "name" => "Slovakia", "code" => "SVK", "region_type" => "country", "center" => "[48.669026, 19.699024]" },
  { "name" => "Slovenia", "code" => "SVN", "region_type" => "country", "center" => "[46.151241, 14.995463]" },
  { "name" => "Sweden", "code" => "SWE", "region_type" => "country", "center" => "[60.128161, 18.643501]" },
  { "name" => "Swaziland", "code" => "SWZ", "region_type" => "country", "center" => "[-26.522503, 31.465866]" },
  { "name" => "Seychelles", "code" => "SYC", "region_type" => "country", "center" => "[-4.679574, 55.491977]" },
  { "name" => "Syria", "code" => "SYR", "region_type" => "country", "center" => "[34.802075, 38.996815]" },
  { "name" => "Turks and Caicos Islands", "code" => "TCA", "region_type" => "country", "center" => "[21.694025, -71.797928]" },
  { "name" => "Chad", "code" => "TCD", "region_type" => "country", "center" => "[15.454166, 18.732207]" },
  { "name" => "Togo", "code" => "TGO", "region_type" => "country", "center" => "[8.619543, 0.824782]" },
  { "name" => "Thailand", "code" => "THA", "region_type" => "country", "center" => "[15.870032, 100.992541]" },
  { "name" => "Tajikistan", "code" => "TJK", "region_type" => "country", "center" => "[38.861034, 71.276093]" },
  { "name" => "Turkmenistan", "code" => "TKM", "region_type" => "country", "center" => "[38.969719, 59.556278]" },
  { "name" => "East Timor", "code" => "TLS", "region_type" => "country", "center" => "[33.819340, -118.071167]" },
  { "name" => "Tonga", "code" => "TON", "region_type" => "country", "center" => "[-21.178986, -175.198242]" },
  { "name" => "Trinidad and Tobago", "code" => "TTO", "region_type" => "country", "center" => "[10.691803, -61.222503]" },
  { "name" => "Tunisia", "code" => "TUN", "region_type" => "country", "center" => "[33.886917, 9.537499]" },
  { "name" => "Turkey", "code" => "TUR", "region_type" => "country", "center" => "[38.963745, 35.243322]" },
  { "name" => "Tuvalu", "code" => "TUV", "region_type" => "country", "center" => "[-7.109535, 177.64933]" },
  { "name" => "Taiwan", "code" => "TWN", "region_type" => "country", "center" => "[23.69781, 120.960515]" },
  { "name" => "United Republic of Tanzania", "code" => "TZA", "region_type" => "country", "center" => "[-6.369028, 34.888822]" },
  { "name" => "Uganda", "code" => "UGA", "region_type" => "country", "center" => "[1.373333, 32.290275]" },
  { "name" => "Ukraine", "code" => "UKR", "region_type" => "country", "center" => "[48.379433, 31.16558]" },
  { "name" => "United States Minor Outlying Islands", "code" => "UMI", "region_type" => "country", "center" => "[18.044230, -64.835892]" },
  { "name" => "Uruguay", "code" => "URY", "region_type" => "country", "center" => "[-32.522779, -55.765835]" },
  { "name" => "United States of America", "code" => "USA", "region_type" => "country", "center" => "[37.09024, -95.712891]" },
  { "name" => "Uzbekistan", "code" => "UZB", "region_type" => "country", "center" => "[41.377491, 64.585262]" },
  { "name" => "Vatican", "code" => "VAT", "region_type" => "country", "center" => "[41.902916, 12.453389]" },
  { "name" => "Saint Vincent and the Grenadines", "code" => "VCT", "region_type" => "country", "center" => "[12.984305, -61.287228]" },
  { "name" => "Venezuela", "code" => "VEN", "region_type" => "country", "center" => "[6.42375, -66.58973]" },
  { "name" => "British Virgin Islands", "code" => "VGB", "region_type" => "country", "center" => "[18.420695, -64.639968]" },
  { "name" => "United States Virgin Islands", "code" => "VIR", "region_type" => "country", "center" => "[18.335765, -64.896335]" },
  { "name" => "Vietnam", "code" => "VNM", "region_type" => "country", "center" => "[14.058324, 108.277199]" },
  { "name" => "Vanuatu", "code" => "VUT", "region_type" => "country", "center" => "[-15.376706, 166.959158]" },
  { "name" => "Wallis and Futuna", "code" => "WLF", "region_type" => "country", "center" => "[-13.768752, -177.156097]" },
  { "name" => "Samoa", "code" => "WSM", "region_type" => "country", "center" => "[-13.759029, -172.104629]" },
  { "name" => "Yemen", "code" => "YEM", "region_type" => "country", "center" => "[15.552727, 48.516388]" },
  { "name" => "South Africa", "code" => "ZAF", "region_type" => "country", "center" => "[-30.559482, 22.937506]" },
  { "name" => "Zambia", "code" => "ZMB", "region_type" => "country", "center" => "[-13.133897, 27.849332]" },
  { "name" => "Zimbabwe", "code" => "ZWE", "region_type" => "country", "center" => "[-19.015438, 29.154857]" }
]

regions_states= [ { "name" => "Empty Region", "code": "EMPTY" , "region_type" => "ugly", "center" => "[]" },
                  { "name" => "Maine", "code" => "Maine", "region_type" => "state", "center" => "[45.367584, -68.972168]" },
                  { "name" => "Massachusetts", "code" => "Massachusetts", "region_type" => "state", "center" => "[42.407211, -71.382439]" },
                  { "name" => "Michigan", "code" => "Michigan", "region_type" => "state", "center" => "[44.182205, -84.506836]" },
                  { "name" => "Montana", "code" => "Montana", "region_type" => "state", "center" => "[46.965260, -109.533691]" },
                  { "name" => "Nevada", "code" => "Nevada", "region_type" => "state", "center" => "[39.876019, -117.224121]" },
                  { "name" => "New Jersey", "code" => "New Jersey", "region_type" => "state", "center" => "[39.833851, -74.871826]" },
                  { "name" => "New York", "code" => "New York", "region_type" => "state", "center" => "[43.000000, -75.000000]" },
                  { "name" => "North Carolina", "code" => "North Carolina", "region_type" => "state", "center" => "[35.782169, -80.793457]" },
                  { "name" => "Ohio", "code" => "Ohio", "region_type" => "state", "center" => "[40.367474, -82.996216]" },
                  { "name" => "Pennsylvania", "code" => "Pennsylvania", "region_type" => "state", "center" => "[41.203323, -77.194527]" },
                  { "name" => "Rhode Island", "code" => "Rhode Island", "region_type" => "state", "center" => "[41.700001, -71.500000]" },
                  { "name" => "Tennessee", "code" => "Tennessee", "region_type" => "state", "center" => "[35.860119, -86.660156]" },
                  { "name" => "Texas", "code" => "Texas", "region_type" => "state", "center" => "[31.000000, -100.000000]" },
                  { "name" => "Utah", "code" => "Utah", "region_type" => "state", "center" => "[39.419220, -111.950684]" },
                  { "name" => "Washington", "code" => "Washington", "region_type" => "state", "center" => "[47.751076, -120.740135]" },
                  { "name" => "Wisconsin", "code" => "Wisconsin", "region_type" => "state", "center" => "[44.500000, -89.500000]" },
                  { "name" => "Maryland", "code" => "Maryland", "region_type" => "state", "center" => "[39.045753, -76.641273]" },
                  { "name" => "Alabama", "code" => "Alabama", "region_type" => "state", "center" => "[32.318230, -86.902298]" },
                  { "name" => "Alaska", "code" => "Alaska", "region_type" => "state", "center" => "[66.160507, -153.369141]" },
                  { "name" => "Arizona", "code" => "Arizona", "region_type" => "state", "center" => "[34.048927, -111.093735]" },
                  { "name" => "Arkansas", "code" => "Arkansas", "region_type" => "state", "center" => "[34.799999, -92.199997]" },
                  { "name" => "California", "code" => "California", "region_type" => "state", "center" => "[36.778259, -119.417931]" },
                  { "name" => "Colorado", "code" => "Colorado", "region_type" => "state", "center" => "[39.113014, -105.358887]" },
                  { "name" => "Connecticut", "code" => "Connecticut", "region_type" => "state", "center" => "[41.599998, -72.699997]" },
                  { "name" => "Delaware", "code" => "Delaware", "region_type" => "state", "center" => "[39.000000, -75.500000]" },
                  { "name" => "Florida", "code" => "Florida", "region_type" => "state", "center" => "[27.994402, -81.760254]" },
                  { "name" => "Georgia", "code" => "Georgia", "region_type" => "state", "center" => "[33.247875, -83.441162]" },
                  { "name" => "Hawaii", "code" => "Hawaii", "region_type" => "state", "center" => "[20.716179, -158.214676]" },
                  { "name" => "Idaho", "code" => "Idaho", "region_type" => "state", "center" => "[44.068203, -114.742043]" },
                  { "name" => "Illinois", "code" => "Illinois", "region_type" => "state", "center" => "[40.000000, -89.000000]" },
                  { "name" => "Indiana", "code" => "Indiana", "region_type" => "state", "center" => "[40.273502, -86.126976]" },
                  { "name" => "Iowa", "code" => "Iowa", "region_type" => "state", "center" => "[42.032974, -93.581543]" },
                  { "name" => "Kansas", "code" => "Kansas", "region_type" => "state", "center" => "[38.500000, -98.000000]" },
                  { "name" => "Kentucky", "code" => "Kentucky", "region_type" => "state", "center" => "[37.839333, -84.270020]" },
                  { "name" => "Louisiana", "code" => "Louisiana", "region_type" => "state", "center" => "[30.391830, -92.329102]" },
                  { "name" => "Minnesota", "code" => "Minnesota", "region_type" => "state", "center" => "[46.392410, -94.636230]" },
                  { "name" => "Mississippi", "code" => "Mississippi", "region_type" => "state", "center" => "[33.000000, -90.000000]" },
                  { "name" => "Missouri", "code" => "Missouri", "region_type" => "state", "center" => "[38.573936, -92.603760]" },
                  { "name" => "Nebraska", "code" => "Nebraska", "region_type" => "state", "center" => "[41.500000, -100.000000]" },
                  { "name" => "New Hampshire", "code" => "New Hampshire", "region_type" => "state", "center" => "[44.000000, -71.500000]" },
                  { "name" => "New Mexico", "code" => "New Mexico", "region_type" => "state", "center" => "[34.307144, -106.018066]" },
                  { "name" => "North Dakota", "code" => "North Dakota", "region_type" => "state", "center" => "[47.650589, -100.437012]" },
                  { "name" => "Oklahoma", "code" => "Oklahoma", "region_type" => "state", "center" => "[36.084621, -96.921387]" },
                  { "name" => "Oregon", "code" => "Oregon", "region_type" => "state", "center" => "[44.000000, -120.500000]" },
                  { "name" => "South Carolina", "code" => "South Carolina", "region_type" => "state", "center" => "[33.836082, -81.163727]" },
                  { "name" => "South Dakota", "code" => "South Dakota", "region_type" => "state", "center" => "[44.500000, -100.000000]" },
                  { "name" => "Vermont", "code" => "Vermont", "region_type" => "state", "center" => "[44.000000, -72.699997]" },
                  { "name" => "Virginia", "code" => "Virginia", "region_type" => "state", "center" => "[37.926868, -78.024902]" },
                  { "name" => "West Virginia", "code" => "West Virginia", "region_type" => "state", "center" => "[39.000000, -80.500000]" },
                  { "name" => "Wyoming", "code" => "Wyoming", "region_type" => "state", "center" => "[43.075970, -107.290283]" }]

  AdminUser.create_with(
    password: 'password', 
    password_confirmation: 'password'
  ).find_or_create_by(email: 'admin@example.com')

  # empty region record for safe hand use
  Region.create_with(
    color: "#fff",
    status: :active
  ).find_or_create_by(name: "Empty Region", code: "EMPTY")

#regions_countries.each do |region|
#  Region.create_with(
#      color: "##{SecureRandom.hex(3)}",
#      status: :active,
#      region_type: region["region_type"],
#      center: region["center"]
#    ).find_or_create_by(name: region["name"], code: region["code"])
#    puts region["name"] + " created!\n"
#  end
regions_states.each do |region|
  Region.create_with(
      color: "##{SecureRandom.hex(3)}",
      status: :active,
      region_type: region["region_type"],
      center: region["center"]
    ).find_or_create_by(name: region["name"], code: region["code"])
    puts region["name"] + " created!\n"
  end

