# Korte toelichting Continuous Deployment

Voor deze opdracht heb ik een automatische deploy opgezet voor een Flask-webapplicatie. Dit zorgt ervoor dat nieuwe code meteen op de server komt als alle tests slagen.

# Drie onderdelen

1. **GitHub Actions**
   GitHub Actions voert automatisch tests uit als ik nieuwe code push. Als alles goed gaat, logt GitHub automatisch in op de server om de nieuwste code te halen.

2. **SSH + Bash-script**  
   Via SSH maakt GitHub verbinding met mijn server. Een bash-script op de server voert `git pull` uit en start de applicatie opnieuw op met `systemctl`.

3. **DigitalOcean VPS**  
   Mijn webapp draait op een server van DigitalOcean. Dit is de plek waar alle updates naartoe gaan

# Drie problemen en oplossingen

1. **SSH werkte niet**  
   GitHub kon geen verbinding maken met de server. Dit heb ik opgelost door een nieuwe Ssh-sleutel te maken, de publieke sleutel op de server te zetten en de private sleutel als ‘secret’ op GitHub in te voeren.

2. **Testfout in `test_app.py`**  
   De test faalde omdat `app.test_client()` niet werkte. Ik heb dit opgelost door het juiste object (`app`) te importeren in de testfile.

3. **Pad naar SSH-sleutel klopt niet in Windows**  
   Bij het verbinden via SSH in PowerShell kreeg ik de fout dat het bestand `~/.ssh/id_rsa` niet gevonden werd. Dit kwam doordat Windows een ander pad gebruikt. Ik heb dit opgelost door het volledige pad naar de sleutel te gebruiken, zoals `C:\Users\<gebruikersnaam>\.ssh\id_rsa`.

# Tot slot

Het was leerzaam om zelf een werkende CI/CD-pipeline op te zetten en te zien hoe alles samenwerkt.

