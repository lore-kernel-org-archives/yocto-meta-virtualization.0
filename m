Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.9313.1585136502988894517
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 Mar 2020 04:41:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sixsq-com.20150623.gappssmtp.com header.s=20150623 header.b=Cx9sAv4P;
 spf=pass (domain: sixsq.com, ip: 209.85.219.41, mailfrom: cristovao.cordeiro@sixsq.com)
Received: by mail-qv1-f41.google.com with SMTP id p19so846806qve.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 25 Mar 2020 04:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sixsq-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=BQ5xwaRk0cGPdbyEdB78ji+Vpudf8Y9O/+jErnsaygY=;
        b=Cx9sAv4PgHTWZUTm339YFlnENzG+7kwhcO15JdCo+QT5JJi200HmNjjhAH4iAOZiYo
         fQ2+bMbNQpwXo4mgyNNEC36UYARcSajJ6dkDyJXa2UL+mnrAp9n18N9DrJNwzHAZaJj1
         I9UoP5zJz1n6Bo3wr57U3Owy+LVhaoGZRyantcxtTPywt6UN2GbaG33hOlH3KUCiSq0w
         Fzys+Iag/x0nQPFieCMii5fN8KQbC7zF1FJIiNqyS8ItMSFi/mHZSBjT/S0mPolFJt6G
         M3Fq1LNQ5vTZYkeqsAyC/zU+foq1m0Y2snOI1EAmbwEmxl1t7KG54v5aI0p6uWCHIiJa
         2NOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=BQ5xwaRk0cGPdbyEdB78ji+Vpudf8Y9O/+jErnsaygY=;
        b=KqX4QMpKM0uPcHkxeZFzkWRZE4YvtM+kTu9Z8RfIbPsRZVuL3PIvjoAWji6+zJD1Bg
         nIS2n79cGcY+MdLVXbT46YYMtqxbM1BD3rV+UoS1u/M/EeN6JD4yJg5glDXnkSutus+R
         dDh/XCjxYqqnvB23Gc0rTRyJUqbZmj/yM5jkIKmj+X5CSjaMv8cLmVPwLb+TG6P+oAPL
         zyTG2mZ1GnpWl3AnaA2OrpqF37n2N1pGyfr+n+7QoXnwSyCaui1gXsMX9nmpMM6xHBLc
         QHOVoC9P/3yXZ5BRDsOX2P4flY+7xE3iu6+WoKk9TkaLem8SwVk0ge3uaZCQ1Ej9bCRW
         HXGQ==
X-Gm-Message-State: ANhLgQ1qWWtoYku6Aln7kmhU28EptTgzTQVIrL+NmXzbfXjo1Hm7YIeE
	MLDfV+9l2fX3uD9IOdy0vSWLyO1W1AWCrTC/tmi+A/vH
X-Google-Smtp-Source: ADFU+vsIDgdqtILPZC4SGfYnbrlWJZpe8R7RHTur/laIe8owX3lywKK7lILMQ6kzzGOJ6n6vIkAhcN5SY5fgluJDjsI=
X-Received: by 2002:ad4:5184:: with SMTP id b4mr2648466qvp.221.1585136501811;
 Wed, 25 Mar 2020 04:41:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAE5JARmTU0siEsyQxW601h=A2e=aY64ZqnYCsN=OD0kupeeR1Q@mail.gmail.com>
In-Reply-To: <CAE5JARmTU0siEsyQxW601h=A2e=aY64ZqnYCsN=OD0kupeeR1Q@mail.gmail.com>
From: cristovao.cordeiro@sixsq.com
Date: Wed, 25 Mar 2020 12:41:15 +0100
Message-ID: <CAE5JARkEA_NQnOL3ukKg4RA_AofQTA7JZ3MZhK7gb1F0cGEdeA@mail.gmail.com>
Subject: consistency clarification for INITSCRIPT_NAME in docker-ce recipe
To: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000001c7e1705a1ac5a76"

--0000000000001c7e1705a1ac5a76
Content-Type: text/plain; charset="UTF-8"

Dear Bruce,

I've been trying to build docker-ce with the meta-rapsberrrypi layer. I've
appended "systemd" distro to my build. When doing `bitbake docker-ce` I get
an error about


update-rc.d:
/home/ubuntu/os-raspberrypi/tmp/work/raspberrypi3-poky-linux-gnueabi/core-image-base/1.0-r0/rootfs/etc/init.d/
docker.init: file does not

 exist


After digging for a bit, I've traced this to the following lines:
https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/recipes-containers/docker/docker-ce_git.bb?h=zeus#n105
,
where it states that docker.init shall not be installed if systemd in
DISTRO. That's ok.

But then, in
https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/recipes-containers/docker/docker.inc?h=zeus#n56
,
INITSCRIPT_NAME is set to docker.init cause sysvinit is also in DISTRO.

Isn't this an inconsistency? Those two conditions should be similar IMO.
The only way to bypass this is to add DISTRO_FEATURES_BACKFILL_CONSIDERED =
"sysvinit" to the build.

Best regards,

Cristovao

--0000000000001c7e1705a1ac5a76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear Bruce,<div><br></div><div>I&#39;ve been trying to bui=
ld docker-ce with the meta-rapsberrrypi layer. I&#39;ve appended &quot;syst=
emd&quot; distro to my build. When doing `bitbake docker-ce` I get an error=
 about=C2=A0</div><div><p style=3D"margin:0px;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;font-stretch:normal;font-size:14px;line-heigh=
t:normal;font-family:Menlo;color:rgb(0,0,0)"><span style=3D"font-variant-li=
gatures:no-common-ligatures"><br></span></p></div><blockquote style=3D"marg=
in:0px 0px 0px 40px;border:none;padding:0px"><div><p style=3D"margin:0px;fo=
nt-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:norma=
l;font-size:14px;line-height:normal;font-family:Menlo;color:rgb(0,0,0)"><sp=
an style=3D"font-variant-ligatures:no-common-ligatures">update-rc.d: /home/=
ubuntu/os-raspberrypi/tmp/work/raspberrypi3-poky-linux-gnueabi/core-image-b=
ase/1.0-r0/rootfs/etc/init.d/</span><span style=3D"font-variant-ligatures:n=
o-common-ligatures;color:rgb(255,255,255);background-color:rgb(0,0,0)">dock=
er.init</span><span style=3D"font-variant-ligatures:no-common-ligatures">: =
file does not</span></p></div><div><p style=3D"margin:0px;font-variant-nume=
ric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:14p=
x;line-height:normal;font-family:Menlo;color:rgb(0,0,0)"><span style=3D"fon=
t-variant-ligatures:no-common-ligatures">=C2=A0exist</span></p></div></bloc=
kquote><div>=C2=A0</div><div>After digging for a bit, I&#39;ve traced this =
to the following lines:</div><div><a href=3D"https://git.yoctoproject.org/c=
git/cgit.cgi/meta-virtualization/tree/recipes-containers/docker/docker-ce_g=
it.bb?h=3Dzeus#n105" target=3D"_blank">https://git.yoctoproject.org/cgit/cg=
it.cgi/meta-virtualization/tree/recipes-containers/docker/docker-ce_git.bb?=
h=3Dzeus#n105</a>=C2=A0, where it states that docker.init shall not be inst=
alled if systemd in DISTRO. That&#39;s ok.</div><div><br></div><div>But the=
n, in=C2=A0<a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtu=
alization/tree/recipes-containers/docker/docker.inc?h=3Dzeus#n56" target=3D=
"_blank">https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tre=
e/recipes-containers/docker/docker.inc?h=3Dzeus#n56</a>=C2=A0, INITSCRIPT_N=
AME is set to docker.init cause sysvinit is also in DISTRO.=C2=A0</div><div=
><br></div><div>Isn&#39;t this an inconsistency? Those two conditions shoul=
d be similar IMO. The only way to bypass this is to add=C2=A0DISTRO_FEATURE=
S_BACKFILL_CONSIDERED =3D &quot;sysvinit&quot; to the build.</div><div><br =
clear=3D"all"><div><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div =
dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"=
ltr">Best regards,</div><div dir=3D"ltr"><br></div><div>Cristovao</div></di=
v></div></div></div></div></div></div></div></div></div>

--0000000000001c7e1705a1ac5a76--
