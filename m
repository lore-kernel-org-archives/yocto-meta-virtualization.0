Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web09.8021.1632117976595126324
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 19 Sep 2021 23:06:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PN0APqHv;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: marek.belisko@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id 194so13957256qkj.11
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 19 Sep 2021 23:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=UlGF2pVDWCxRnkVP7V9wcn7qJsOPndeGQzv9+hLdlgo=;
        b=PN0APqHvgJJfx1+h7ikNDsucuiUAZ2oWkoTRcQDnd53QPlQiVAh07AeJy50dVXnmWz
         RYp03Y72kQ9l/fuHf7ia8qfqGQKUCGz7aiH8UjQaJ8joje+MPLDZqPzONuOtCLhLb/fA
         JD8HtMUZtp1eFbDqZLpVpCuNNMh6so9Mnqh545jCVALkhx2ApOqT5C5x9MK4HO97byMh
         LkQwPsi0TwIe2Tf+tpM/OLZza+4cI9cBVZYCUDj6Ja+9lFVvfEwweCXmIXiWA9X/3UZg
         Dz5qwg5lz5/pr2IQsRcOBSPfqrdAUCmP/RmN7+RQp4j88W15ZHmH+s+dDiewV2TgZNBO
         OYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=UlGF2pVDWCxRnkVP7V9wcn7qJsOPndeGQzv9+hLdlgo=;
        b=ebPZebNkBaqVlzaOda2M50E8ZcgUSYioVS7DI7ymsXMmseNrm82le2r+kUhK/TdjjW
         LWYB7EGtVB+oaaKgTqPtYCuMC/7rEF6lFohbDdoW0Dyds+OeDYRHkBKEUq0JtwsVXK5c
         awXmjq+RNccLp1RLCeE37yt+3wRF2xBYAMgQuNPFDrNAEI59gzrOo3zkcilDyAKJHYSH
         1/wmRCepLu8Gt2Mm1m2MrLlNEQwI+K3Jztudq80hTuKeK56KPB5/oQMOmn7qDOUI/yO7
         PzT3dcMG9tiobLEb9gP2ubPScxr91znShawWcm6gynR5RxDTsdvB0Ei9k1KniCCyXpD1
         CjNA==
X-Gm-Message-State: AOAM532IOW+Le/OsEfCQssXF5HnUJn3FmA8xdCi8IX7aYjkG9hbafc7U
	f60Ou6YsbdKd88n99u/AQAQYrAOFvPjx0lYZpqdKqz9ImhGdJQ==
X-Google-Smtp-Source: ABdhPJzH1uDWWLb1YWtyHIx8b2Qp5B2EQ4UvbXUjE7sjRqKdpZDk8GFKuBtnyvtWWtQXgtj3EDrO6MPo69Edu3GBQhw=
X-Received: by 2002:a25:688b:: with SMTP id d133mr28303188ybc.511.1632117975410;
 Sun, 19 Sep 2021 23:06:15 -0700 (PDT)
MIME-Version: 1.0
From: "Marek Belisko" <marek.belisko@gmail.com>
Date: Mon, 20 Sep 2021 08:06:03 +0200
Message-ID: <CAAfyv36nwa3u92Jx7eRXxgu=dq1fXSGo_prPgJ41f1Ab5C=PzQ@mail.gmail.com>
Subject: building latest docker on dunfell branch
To: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

For my project I would need to use the latest docker build which can
be found in the master branch. I backported it to dunfell and I have
an issue with compilation of docker-ce like:

 #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| # GITCOMMIT =3D d24c6dc5cf-unsupported
| # The version you are building is listed as unsupported because
| # there are some files in the git repository that are in an uncommitted s=
tate.
| # Commit these changes, or add to .gitignore to remove the
-unsupported from the version.
| # Here is the current list:
|  M hack/make/.binary
| #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| Package devmapper was not found in the pkg-config search path.
| Perhaps you should add the directory containing `devmapper.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'devmapper' found
| Removing bundles/
|
| ---> Making bundle: dynbinary (in bundles/dynbinary)
| Building: bundles/dynbinary-daemon/dockerd-20.10.8-ce
| GOOS=3D"linux" GOARCH=3D"arm" GOARM=3D"7"
| can't load package: package github.com/docker/docker/cmd/dockerd:
cannot find package "github.com/docker/docker/cmd/dockerd" in any of:
| /home/marek/yocto/.build/tmp/work/cortexa7t2hf-neon-fslc-linux-gnueabi/do=
cker-ce/20.10.8-ce+gitd24c6dc5cf5e68dfb30027b2db454099566a9b9e-r0/recipe-sy=
sroot-native/usr/lib/arm-fslc-linux-gnueabi/go/src/github.com/docker/docker=
/cmd/dockerd
(from $GOROOT)
| /home/marek/yocto/.build/tmp/work/cortexa7t2hf-neon-fslc-linux-gnueabi/do=
cker-ce/20.10.8-ce+gitd24c6dc5cf5e68dfb30027b2db454099566a9b9e-r0/git/src/i=
mport/.gopath_/home/marek/yocto/.build/tmp/work/cortexa7t2hf-neon-fslc-linu=
x-gnueabi/docker-ce/20.10.8-ce+gitd24c6dc5cf5e68dfb30027b2db454099566a9b9e-=
r0/git/src/import/vendor_/home/marek/yocto/.build/tmp/work/cortexa7t2hf-neo=
n-fslc-linux-gnueabi/docker-ce/20.10.8-ce+gitd24c6dc5cf5e68dfb30027b2db4540=
99566a9b9e-r0/recipe-sysroot/usr/local/go/src/github.com/docker/docker/cmd/=
dockerd
(from $GOPATH)
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of
'/home/marek/yocto/.build/tmp/work/cortexa7t2hf-neon-fslc-linux-gnueabi/doc=
ker-ce/20.10.8-ce+gitd24c6dc5cf5e68dfb30027b2db454099566a9b9e-r0/temp/run.d=
o_compile.3085'
failed with exit code 1:

There seems to be some issue with dependencies. Any idea how to
properly backport it or make it working? Thanks.

BR,

marek

--=20
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
