Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web09.6742.1575961887788777558
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Dec 2019 23:11:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I2kxNRHT;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id c93so15024574edf.7
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Dec 2019 23:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gaDWrgVV8nUfez2B51BQ6I4CPPuLggXgAHf+2sHSiAk=;
        b=I2kxNRHTwQo7fRnY6EBncmoSJYnnQsi2Jgl5rPqcTyhUVbl7rXDo5tDgrQFp6O/cr4
         5AXfD8bgfVYrjPHn0ijTxxXcBUd03UBm9N7ozmNrT2VINk904zdlDC4E3KwRlofTZ2t5
         ipzfK6PK4ORu/DNAqTH5BskhUdpVPlKbQowsVRxg83PHvR6ss2mQePxLVuFv/b39bk4F
         mia+kOMlXztrE19GaHaKbPZofBDAyoMk8vTMSfxLjMxpW1/QiyuC0JxMBbLxoPUIvkBW
         xnAHfAKoGPN/f2c2/Fd3ivw2uV7w4IkqfZcCKz4H0xHHMU/87edWxh/NEt3Iq0lsG1l+
         ElvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gaDWrgVV8nUfez2B51BQ6I4CPPuLggXgAHf+2sHSiAk=;
        b=t/DUn4WVWqmhve5HkWa7wghJn6B3WkUo2fj8YLzy6i2m/AHIjQMgXCxAEczoXS0swC
         2WRX3imkbiHRm1mldJusmAzmM1Dp1TgeD5Dy2xRJkjukl3Thl3cbzvroKg+U8BrZ8FkN
         ER3cboMzFdRjaNH2nl9T59i8Vcd01D3Io2srB/DvsOWl5F3FnS4OiizHBDpmKlu6SrhS
         pPOBKccoL3q5aN6BVKBBb6Ma58xHFNiW0W9wnQ3PJAeopfJ3ea9LUfcDz61IVbMFBKl8
         d8YmzlKhTWr46IARtCFt7jJhUZ0L8anrVpyd8nLyfCfFMTHC5gXEvci4W3w29K7Jxh+/
         wMqA==
X-Gm-Message-State: APjAAAULKNNd+PudJggYBo3G3y7oE2yzCHK0FJ9m/a6TREyVQmu4ph07
	ckNONZu6FB7x1OaObZGlmJd9T4OHP+73RvbPJ78=
X-Google-Smtp-Source: APXvYqzev5ERDjzDUG+xgXEwJqzMtGxlWUh5XEtwV0pAfhJuiTB/oIfRUGn1jztkbxqClati9Bf69VQRDIBS6s6ynew=
X-Received: by 2002:aa7:d445:: with SMTP id q5mr36455433edr.16.1575961886139;
 Mon, 09 Dec 2019 23:11:26 -0800 (PST)
MIME-Version: 1.0
References: <1575314833-10994-1-git-send-email-liu.ming50@gmail.com>
 <CADkTA4MB39xztYRKj-g=V63f1Zhp7S62UPuV9heOK-F9aOc0QQ@mail.gmail.com> <CALatG=5P9fCk08_ggUz4OAs03DJBqcXmzN7KsNP3joWgTveHFw@mail.gmail.com>
In-Reply-To: <CALatG=5P9fCk08_ggUz4OAs03DJBqcXmzN7KsNP3joWgTveHFw@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 10 Dec 2019 02:11:15 -0500
Message-ID: <CADkTA4NTeqvmEG386aEW8f6DetJtYpuioLCDdyGTvdFvsr1PUw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 0/3] Uprev docker-compose to 1.25.0
To: Ming Liu <liu.ming50@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Stefan Agner <stefan.agner@toradex.com>, ChenQi <Qi.Chen@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 7, 2019 at 8:25 AM Ming Liu <liu.ming50@gmail.com> wrote:
>
> Hi, Bruce:
>
> I think I had introduced a regression for this "python3-docker-compose: u=
prev to 1.25.0" commit, it depends on python3-paramiko and python3-nacl but=
 I forgot to add them, sorry for that.
>
> I have just sent two more patches to add them in.

And they are now merged.

Bruce

>
> //Ming Liu
>
> Bruce Ashfield <bruce.ashfield@gmail.com> =E6=96=BC 2019=E5=B9=B412=E6=9C=
=886=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=888:08=E5=AF=AB=E9=81=93=
=EF=BC=9A
>>
>> merged
>>
>> Bruce
>>
>> On Mon, Dec 2, 2019 at 2:27 PM Ming Liu <liu.ming50@gmail.com> wrote:
>> >
>> > From: Ming Liu <liu.ming50@gmail.com>
>> >
>> > This patch set mainly aims to uprev docker-compose to 1.25.0 and also
>> > upgrade some of its dependencies to the latest release version.
>> >
>> > Test on a colibri-imx8x machine against:
>> > https://docs.docker.com/compose/gettingstarted/
>> >
>> > Ming Liu (3):
>> >   python-docker-pycreds: uprev to 0.4.0
>> >   python-docker: uprev to 4.1.0
>> >   python3-docker-compose: uprev to 1.25.0
>> >
>> >  ...up.py-remove-maximum-version-requirements.patch | 33 +++++++++++--=
--------
>> >  .../python3-docker-compose_1.21.2.bb               | 31 -------------=
-------
>> >  .../python3-docker-compose_1.25.0.bb               | 34 +++++++++++++=
+++++++++
>> >  recipes-devtools/python/python-docker-pycreds.inc  |  4 +--
>> >  ...eds_0.3.0.bb =3D> python-docker-pycreds_0.4.0.bb} |  0
>> >  recipes-devtools/python/python-docker.inc          |  4 +--
>> >  ...thon-docker_3.4.0.bb =3D> python-docker_4.1.0.bb} |  0
>> >  ...ds_0.3.0.bb =3D> python3-docker-pycreds_0.4.0.bb} |  0
>> >  ...on3-docker_3.4.0.bb =3D> python3-docker_4.1.0.bb} |  0
>> >  9 files changed, 55 insertions(+), 51 deletions(-)
>> >  delete mode 100644 recipes-containers/docker-compose/python3-docker-c=
ompose_1.21.2.bb
>> >  create mode 100644 recipes-containers/docker-compose/python3-docker-c=
ompose_1.25.0.bb
>> >  rename recipes-devtools/python/{python-docker-pycreds_0.3.0.bb =3D> p=
ython-docker-pycreds_0.4.0.bb} (100%)
>> >  rename recipes-devtools/python/{python-docker_3.4.0.bb =3D> python-do=
cker_4.1.0.bb} (100%)
>> >  rename recipes-devtools/python/{python3-docker-pycreds_0.3.0.bb =3D> =
python3-docker-pycreds_0.4.0.bb} (100%)
>> >  rename recipes-devtools/python/{python3-docker_3.4.0.bb =3D> python3-=
docker_4.1.0.bb} (100%)
>> >
>> > --
>> > 2.7.4
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> >
>> > View/Reply Online (#4799): https://lists.yoctoproject.org/g/meta-virtu=
alization/message/4799
>> > Mute This Topic: https://lists.yoctoproject.org/mt/65175066/1050810
>> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsu=
b  [bruce.ashfield@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
