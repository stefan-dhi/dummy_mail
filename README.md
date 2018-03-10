## Catch all emails sent from PHP

### the problem 

During development, I don't want my PHP app to send emails to the outside world,
but it'd still be useful to be able to collect & read the ougoing emails.

There are various ways, for example disabling PHP's mail() function, or
installing sendmail with a demon listening on port 25, or insatlling software like Papercut.
However they're all kind of complicated with varying degrees of side effects.

Much easier to simply configure PHP to talk to something that only pretends to send mail!

### install 
```bash
sudo mkdir -p /opt/dummy-smtp/mail/new
sudo chown -R [your user name]:users /opt/dummy-smtp
cd /opt/dummy-smtp/
wget https://raw.githubusercontent.com/stefan-dhi/dummy_mail/master/sendmail.sh
chown [your user name]:users ./sendmail.sh
chmod ug+x ./sendmail.sh
chmod -R a+rw ./mail
```

### edit php.ini
```ini
...
[mail function]
sendmail_path = /opt/dummy-smtp/sendmail.sh
...
```

### usage

Invoking PHP's mail() function will write the raw mail content to a uniquely named
file in ```/opt/dummy-smtp/mail/new``` ready for your perusal.

