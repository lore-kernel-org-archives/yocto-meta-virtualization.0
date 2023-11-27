Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE430C4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 19:54:40 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web11.104888.1701114878245120094
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Nov 2023 11:54:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KWo+T/kK;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-359c22c44d6so19342715ab.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Nov 2023 11:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701114877; x=1701719677; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jez/GRZQeFb+ConHSoP5X5B+fdCLVty/IRPgqNbRTpU=;
        b=KWo+T/kKRujjfIhrfqvDnxwMy3rNAGxNrMooaO0RtVQSSOVeNxubi0EG00tSlmo8lV
         cbGLO+IZqAuH15F4rQo2V73wnPnQq0kdy9UlOpWE+hXj3WG9Vu5w59zbDbOkRmkp+NLb
         DIp0uoECKuGN0Z4FcFSKgwkQgfeV0GmWnf6pyJnVyUWpiW6u8dinlkrIRdfBP0nW3r6l
         iFTBYyxZu5y0F/QhUiviK5uUc8EboFFuRzwvFxUqbP/+5ljtELHfY/g2YF2da5wxDA5D
         MTznbxZt0gMp4hdvP2fWZnzJDfcF8B5oa3av0WGFcG0n0JMg7qJHmkGivndB8QxvWUcH
         CT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701114877; x=1701719677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jez/GRZQeFb+ConHSoP5X5B+fdCLVty/IRPgqNbRTpU=;
        b=FaF2Hy7b1iRpStWJTj3TE0sg/5pPWJ/P6D81Fm53doq66Cz7USHEaOybkJmzL29iCA
         QlJ4h+T4w2+FUvD9V4uC+QwiL3GhYs+190nQOZqA/ah1LjGetaSZEbR3yzQZNjKPsATV
         oTkHCMnc5S8TJfuZt5yJJlwULYKWccQHc9sXExvvs9Mj2YAaUXR6HVTljmKuqdGWPS18
         hT0j4HWgk8g//NTV7zlP3BxbRAjEdCDZYou7/P8VeST7JNpYUvSIDu2d3QQbmovwHCnB
         DPk/5lXarZAndubO6rj6M7qamKM6WW39O8W0+TigLW0x3TeRK44914x28WJplppoex5S
         yNFw==
X-Gm-Message-State: AOJu0Yyp5RX8lmI8M84E5kL21gqwqO21HIVeDprBIoYuZ7BgtZFLxRTj
	kg4cgalCi5/9TplVFCblcOwR7ZCRCGfv9+dG1sg=
X-Google-Smtp-Source: AGHT+IHPIDOaD0Q5tYQ6La91sUODBzHAkXDwupDk1arkhh5bU+ulDAFnaQWvZBkWQcQ/2XoxIip/szbVYjKYp5wUxCQ=
X-Received: by 2002:a05:6e02:12e5:b0:35b:4731:15f3 with SMTP id
 l5-20020a056e0212e500b0035b473115f3mr15175836iln.10.1701114877470; Mon, 27
 Nov 2023 11:54:37 -0800 (PST)
MIME-Version: 1.0
References: <20231127170157.1931574-1-jose.quaresma@foundries.io>
In-Reply-To: <20231127170157.1931574-1-jose.quaresma@foundries.io>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 27 Nov 2023 14:54:26 -0500
Message-ID: <CADkTA4MzL4aMvSDfXn_okbc8Rm6Y0JhfDwJQ5Pveb-f+YipkLQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] docker-compose: drop unused patches
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Nov 2023 19:54:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8473

We should tweak the commit message to say "the removed python
version", as it doesn't exist anymore :)

Bruce

On Mon, Nov 27, 2023 at 12:02=E2=80=AFPM Jose Quaresma <quaresma.jose@gmail=
.com> wrote:
>
> Drop unused patches from the python version
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  ...0001-setup.py-import-fastentrypoints.patch | 28 ---------
>  ...-remove-maximum-version-requirements.patch | 57 -------------------
>  2 files changed, 85 deletions(-)
>  delete mode 100644 recipes-containers/docker-compose/files/0001-setup.py=
-import-fastentrypoints.patch
>  delete mode 100644 recipes-containers/docker-compose/files/0001-setup.py=
-remove-maximum-version-requirements.patch
>
> diff --git a/recipes-containers/docker-compose/files/0001-setup.py-import=
-fastentrypoints.patch b/recipes-containers/docker-compose/files/0001-setup=
.py-import-fastentrypoints.patch
> deleted file mode 100644
> index df613e8..0000000
> --- a/recipes-containers/docker-compose/files/0001-setup.py-import-fasten=
trypoints.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From f3a22f0f14a4b3313e6405dfb6c97df949493a34 Mon Sep 17 00:00:00 2001
> -From: Ming Liu <liu.ming50@gmail.com>
> -Date: Thu, 30 Jan 2020 17:22:19 +0100
> -Subject: [PATCH] setup.py: import fastentrypoints
> -
> -Upstream-Status: Inappropriate [OE specific configuration]
> -
> -Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ----
> - setup.py | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/setup.py b/setup.py
> -index ad57969..3cccffc 100644
> ---- a/setup.py
> -+++ b/setup.py
> -@@ -12,7 +12,7 @@ import sys
> - import pkg_resources
> - from setuptools import find_packages
> - from setuptools import setup
> --
> -+import fastentrypoints
> -
> - def read(*parts):
> -     path =3D os.path.join(os.path.dirname(__file__), *parts)
> ---
> -2.7.4
> -
> diff --git a/recipes-containers/docker-compose/files/0001-setup.py-remove=
-maximum-version-requirements.patch b/recipes-containers/docker-compose/fil=
es/0001-setup.py-remove-maximum-version-requirements.patch
> deleted file mode 100644
> index 7205d3b..0000000
> --- a/recipes-containers/docker-compose/files/0001-setup.py-remove-maximu=
m-version-requirements.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -From e3aca6421e003d03d119e69bf3d6b30bb5c662c9 Mon Sep 17 00:00:00 2001
> -From: Chen Qi <Qi.Chen@windriver.com>
> -Date: Fri, 22 Nov 2019 09:24:58 +0800
> -Subject: [PATCH] setup.py: remove maximum version requirements
> -
> -Remove maximum version requirements so that docker-compose will not
> -require old version recipes.
> -
> -Upstream-Status: Inappropriate [OE Specific]
> -
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> -Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ----
> - setup.py | 24 ++++++++++++------------
> - 1 file changed, 12 insertions(+), 12 deletions(-)
> -
> -Index: docker-compose-1.29.1/setup.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- docker-compose-1.29.1.orig/setup.py
> -+++ docker-compose-1.29.1/setup.py
> -@@ -25,16 +25,21 @@
> -
> -
> - install_requires =3D [
> --    'docopt >=3D 0.6.1, < 1',
> --    'PyYAML >=3D 3.10, < 6',
> --    'requests >=3D 2.20.0, < 3',
> --    'texttable >=3D 0.9.0, < 2',
> -+    'docopt >=3D 0.6.1',
> -+    'PyYAML >=3D 3.10',
> -+    'requests >=3D 2.20.0',
> -+    'texttable >=3D 0.9.0',
> -     'websocket-client >=3D 0.32.0, < 1',
> -     'distro >=3D 1.5.0, < 2',
> --    'docker[ssh] >=3D 5',
> -+    'docker[ssh] >=3D 4.4.0, < 5',
> -     'dockerpty >=3D 0.4.1, < 1',
> -     'jsonschema >=3D 2.5.1, < 4',
> --    'python-dotenv >=3D 0.13.0, < 1',
> -+    'websocket-client >=3D 0.32.0',
> -+    'distro >=3D 1.5.0',
> -+    'docker[ssh] >=3D 5',
> -+    'dockerpty >=3D 0.4.1',
> -+    'jsonschema >=3D 2.5.1',
> -+    'python-dotenv >=3D 0.13.0',
> - ]
> -
> -
> -@@ -51,7 +56,7 @@
> -     ':python_version < "3.5"': ['backports.ssl_match_hostname >=3D 3.5,=
 < 4'],
> -     ':python_version < "3.8"': ['cached-property >=3D 1.2.0, < 2'],
> -     ':sys_platform =3D=3D "win32"': ['colorama >=3D 0.4, < 1'],
> --    'socks': ['PySocks >=3D 1.5.6, !=3D 1.5.7, < 2'],
> -+    'socks': ['PySocks >=3D 1.5.6, !=3D 1.5.7'],
> -     'tests': tests_require,
> - }
> -
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8470): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8470
> Mute This Topic: https://lists.yoctoproject.org/mt/102833129/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

