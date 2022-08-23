Return-Path: <vsuneja63@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54CDAC32774
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 18:38:17 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web12.1602.1661279892436816080
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 23 Aug 2022 11:38:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qYMnV/Cn;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: vsuneja63@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id bj12so12129931ejb.13;
        Tue, 23 Aug 2022 11:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=NeghtKQPjn6yHsd1YI2q3Skv4FswPS1+yFu3H/6Eufk=;
        b=qYMnV/CnF3ka4Vo7NovkQfvloHGC33/0J7I16yVx/4rcq0zjLpEV6GJDG0oDUeByG5
         K3TrNIUuo/aQbh+TGP8jq2QPech5+SKtIMm2mkqR+0hTw4hEW3DA8lU9R2o8DRu1fyPL
         TIj0v8WtBxb3RAMtyp3uBfR4TGswnFCVFOwcU47fW+EfJYwqir8v68VSbX8eEozGELst
         HR3ntci4Mv/GiEkq4xRsuLr1QgScenh1EdinmZs1rNaEmnU5xCRinFd/XIStdqbWgfYd
         Zb9kgI5DouO7nQ+aGxnveXaP8WhQ9gsItPA+2M91GmlA6q1/V/2K/dcNVjEhRvcGZ/nH
         8zMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=NeghtKQPjn6yHsd1YI2q3Skv4FswPS1+yFu3H/6Eufk=;
        b=G6Qzp3LAvghWfNn3/tsroM2EHKJjyMR9KhGIiP7iAgb9Gtb3+S1xCZFzcKw8pnaWFO
         +PbAPYaeIBleoLSrYjxL/LmD62HwW/3Pkim4mxIYZfdTOSivgUG88rkupv7Nic0zd5RY
         LH2MFm/eIKGkhUJJwBubci9xB7MJYhQx8IukuyRBSF1qcqUx0FJZIfijXaFGkhX6eBQv
         UlzQ9gr7/EoHhD7WpW2oxeOGyAijl2+z/Qw0kCWOUlahO+PDshTt3wdlF6VugAnZQled
         PhxSVbG61G33yeBefJwzfxWo3hkhWZh6OdfmW6em1j/HSaiQL2Qx9ufKHjNtD6NM6MEg
         a5Jw==
X-Gm-Message-State: ACgBeo3q9pSOUoUyzdd/JS8GI4SPESW0oBnr7LVkNWiYRntsfAks9d9b
	7QzWSOVFWnQ0OnkERN4OCTfh1VctGYh7D4T3AvGDCdLLlUEimQ==
X-Google-Smtp-Source: 
 AA6agR60ZQfJYmFUYRw2+GSlGnoZySVg0vxmLo16fzaM2VFLhp0nBLV6/q3sSxHrcjV//KJ9lUyTVTDFxBk5nEUKlpg=
X-Received: by 2002:a17:907:9808:b0:73d:7f87:b626 with SMTP id
 ji8-20020a170907980800b0073d7f87b626mr612675ejc.118.1661279890245; Tue, 23
 Aug 2022 11:38:10 -0700 (PDT)
MIME-Version: 1.0
From: Vipul Suneja <vsuneja63@gmail.com>
Date: Wed, 24 Aug 2022 00:06:58 +0530
Message-ID: 
 <CALAP8f9CG3qkPUNQzebsc3TbY=+qunKzNR+Y-wymCzCdGrW19Q@mail.gmail.com>
Subject: Porting xen on rpi4
To: meta-virtualization@lists.yoctoproject.org, main@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000bb0e3405e6ecdd73"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 23 Aug 2022 18:38:17 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7555

--000000000000bb0e3405e6ecdd73
Content-Type: text/plain; charset="UTF-8"

Hi,

I am porting xen hypervisor on rpi4 with yocto kirkstone sources. Followed
the basic steps to build xen-image-minimal & xen-guest-image-minimal. I
could flash sd card with xen minimal image & could see dom0 up. I copied
"Image", "xen-guest-image-minimal" .ext3 file & guest.cfg . After that
created a bridge with below step:

killall -SIGUSR2 udhcpc
brctl addbr xenbr0
brctl addif xenbr0 eth0
killall udhcpc
udhcpc -R -b -p /var/run/udhcpc.xenbr0.pid -i xenbr0

After that while mouting guest file system its showing no such file or
directory.

















*[23:40:15] <Guest9046> root@raspberrypi4-64:~# ls -l[23:40:15] <Guest9046>
-rw-r--r--    1 root     root      24652288 Mar  9 12:36 Image[23:40:15]
<Guest9046> -rw-r--r--    1 root     root           247 Mar  9 12:37
guest1.cfg[23:40:15] <Guest9046> -rw-r--r--    1 root     root
868220928 Mar  9 12:39
xen-guest-image-minimal-raspberrypi4-64.ext3[23:40:15] <Guest9046>
root@raspberrypi4-64:~# chmod 0777
xen-guest-image-minimal-raspberrypi4-64.ext3[23:40:15] <Guest9046>
root@raspberrypi4-64:~# ls -l[23:40:15] <Guest9046> -rw-r--r--    1 root
  root      24652288 Mar  9 12:36 Image[23:40:15] <Guest9046> -rw-r--r--
 1 root     root           247 Mar  9 12:37 guest1.cfg[23:40:15]
<Guest9046> -rwxrwxrwx    1 root     root     868220928 Mar  9 12:39
xen-guest-image-minimal-raspberrypi4-64.ext3[23:40:15] <Guest9046>
root@raspberrypi4-64:~# losetup /dev/loop0
xen-guest-image-minimal-raspberrypi4-64.ext3[23:40:15] <Guest9046> losetup:
xen-guest-image-minimal-raspberrypi4-64.ext3: No such file or
directory[23:40:15] <Guest9046> root@raspberrypi4-64:~# losetup /dev/loop0
/home/root/xen-guest-image-minimal-raspberrypi4-64.ext3[23:40:15]
<Guest9046> losetup:
/home/root/xen-guest-image-minimal-raspberrypi4-64.ext3: No such file or
directory[23:40:15] <Guest9046> root@raspberrypi4-64:~#[23:40:15]
<Guest9046> root@raspberrypi4-64:~#[23:40:15] <Guest9046>
root@raspberrypi4-64:~#[23:40:15] <Guest9046> root@raspberrypi4-64:~#
losetup /dev/loop0
/home/root/xen-guest-image-minimal-raspberrypi4-64.ext3[23:40:15]
<Guest9046> losetup:
/home/root/xen-guest-image-minimal-raspberrypi4-64.ext3: No such file or
directory*

*Any input on this issue will be really helpful, expecting response asap.*

Thanks & Regards,
Vipul Kumar

--000000000000bb0e3405e6ecdd73
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I am porting xen hypervisor on rpi4=
 with yocto kirkstone sources. Followed the basic steps to build xen-image-=
minimal &amp; xen-guest-image-minimal. I could flash sd card with xen minim=
al image &amp; could see dom0 up. I copied &quot;Image&quot;, &quot;xen-gue=
st-image-minimal&quot; .ext3 file &amp; guest.cfg . After that created a br=
idge with below step:</div><div><br></div>killall -SIGUSR2 udhcpc<br>brctl =
addbr xenbr0<br>brctl addif xenbr0 eth0<br>killall udhcpc<br><div>udhcpc -R=
 -b -p /var/run/udhcpc.xenbr0.pid -i xenbr0=C2=A0</div><div><br></div><div>=
After that while mouting=C2=A0guest file system its showing no such file or=
 directory.</div><div><b>[23:40:15] &lt;Guest9046&gt; root@raspberrypi4-64:=
~# ls -l<br>[23:40:15] &lt;Guest9046&gt; -rw-r--r-- =C2=A0 =C2=A01 root =C2=
=A0 =C2=A0 root =C2=A0 =C2=A0 =C2=A024652288 Mar =C2=A09 12:36 Image<br>[23=
:40:15] &lt;Guest9046&gt; -rw-r--r-- =C2=A0 =C2=A01 root =C2=A0 =C2=A0 root=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 247 Mar =C2=A09 12:37 guest1.cfg<br>[23=
:40:15] &lt;Guest9046&gt; -rw-r--r-- =C2=A0 =C2=A01 root =C2=A0 =C2=A0 root=
 =C2=A0 =C2=A0 868220928 Mar =C2=A09 12:39 xen-guest-image-minimal-raspberr=
ypi4-64.ext3<br>[23:40:15] &lt;Guest9046&gt; root@raspberrypi4-64:~# chmod =
0777 xen-guest-image-minimal-raspberrypi4-64.ext3<br>[23:40:15] &lt;Guest90=
46&gt; root@raspberrypi4-64:~# ls -l<br>[23:40:15] &lt;Guest9046&gt; -rw-r-=
-r-- =C2=A0 =C2=A01 root =C2=A0 =C2=A0 root =C2=A0 =C2=A0 =C2=A024652288 Ma=
r =C2=A09 12:36 Image<br>[23:40:15] &lt;Guest9046&gt; -rw-r--r-- =C2=A0 =C2=
=A01 root =C2=A0 =C2=A0 root =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 247 Mar =C2=
=A09 12:37 guest1.cfg<br>[23:40:15] &lt;Guest9046&gt; -rwxrwxrwx =C2=A0 =C2=
=A01 root =C2=A0 =C2=A0 root =C2=A0 =C2=A0 868220928 Mar =C2=A09 12:39 xen-=
guest-image-minimal-raspberrypi4-64.ext3<br>[23:40:15] &lt;Guest9046&gt; ro=
ot@raspberrypi4-64:~# losetup /dev/loop0 xen-guest-image-minimal-raspberryp=
i4-64.ext3<br>[23:40:15] &lt;Guest9046&gt; losetup: xen-guest-image-minimal=
-raspberrypi4-64.ext3: No such file or directory<br>[23:40:15] &lt;Guest904=
6&gt; root@raspberrypi4-64:~# losetup /dev/loop0 /home/root/xen-guest-image=
-minimal-raspberrypi4-64.ext3<br>[23:40:15] &lt;Guest9046&gt; losetup: /hom=
e/root/xen-guest-image-minimal-raspberrypi4-64.ext3: No such file or direct=
ory<br>[23:40:15] &lt;Guest9046&gt; root@raspberrypi4-64:~#<br>[23:40:15] &=
lt;Guest9046&gt; root@raspberrypi4-64:~#<br>[23:40:15] &lt;Guest9046&gt; ro=
ot@raspberrypi4-64:~#<br>[23:40:15] &lt;Guest9046&gt; root@raspberrypi4-64:=
~# losetup /dev/loop0 /home/root/xen-guest-image-minimal-raspberrypi4-64.ex=
t3<br>[23:40:15] &lt;Guest9046&gt; losetup: /home/root/xen-guest-image-mini=
mal-raspberrypi4-64.ext3: No such file or directory</b><br></div><div><b><b=
r></b></div><div><b>Any input on this issue will be really helpful, expecti=
ng response asap.</b></div><div><b><br></b></div><div>Thanks &amp; Regards,=
</div><div>Vipul Kumar</div></div>

--000000000000bb0e3405e6ecdd73--

