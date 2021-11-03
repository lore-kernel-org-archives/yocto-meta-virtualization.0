Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web08.8038.1635948361438979612
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 03 Nov 2021 07:06:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nkahm+IN;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 17so4096282ljq.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 03 Nov 2021 07:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g53QuSoShNqsuYs+KQ/jfP6wgIlGPr0wEpBnL+BcA1M=;
        b=nkahm+INA6NSctdJmzspNCyNbN8uouqrp1FziSCZ5pl6nTWYJmGjuHSAnOxAfX1bDX
         1yE3s6M+Ve8bOOXjdI9jJBvLKwk4dRjnz8kB1dXg8Xw6HThj+UI29aq9oA3IxADcU3bo
         p76Fr+APlJXk4VPH4UHr9cDSTtEwdeWEEfIglSFfGDujc5rrbRzZ/zbyy3fthcyK2YcF
         Ci63bc8ZWh4zdbM07Ds9E1c+981mf+2XTDshzzs3J8EWD6sJGxyaEg+/UzkU67CkEINt
         1PSrC3OVbqR8Yfju19DLQ+L2mrx5hR/NMQduzY+514RF6m0gx4xzYoNcQK3xfS0qTr2H
         pdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g53QuSoShNqsuYs+KQ/jfP6wgIlGPr0wEpBnL+BcA1M=;
        b=qLC070g9hoSAunnqCNogT5SQLHiZGcD3LhdieA+A0bFRakf8nTdH0jdqVF7IoW8CPi
         NWIerYLCGhgWc/Yq4XjjdWfHzDvLXMHssTrn4we/FhauVL7nGc+B6a8MrLvxUcrN8V0X
         nTYGI3zM7lGjM8lwXjdyeAz+m0YCwnTozGdF0RBAUZygBROVvyldISUnimrwqHH6gq/g
         D4yzdbWZrE/fntBVAUok5LXTCriZNsKgSATyPvHmY+EQaUryOCJjRaiDJaglNPCNhYgs
         zOf9qwCFa8NC3uP9aOnxxKa3FBox8/blNVWOb99dYo2YxFyEXabdmlLfz/pN/64UTPqV
         vEPQ==
X-Gm-Message-State: AOAM533roTpBW49D+Ok3w/XujvlmkUxNuoXDLy24dgV3sVw8USboe9gX
	nC5OEjKo2VAbiMzEMUhkm3XrEnShxQoV2BvW/XQ=
X-Google-Smtp-Source: ABdhPJz7wJY+gAOYVzWelrE7yfMdO9/aMh6xfvRAIK3lOugIycWWWzzcfXQQuI3Sh5VaM+FJ/QpNzZK0RiALyaXP1LU=
X-Received: by 2002:a2e:7c03:: with SMTP id x3mr4636744ljc.447.1635948359463;
 Wed, 03 Nov 2021 07:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <20211103085123.694138-1-Martin.Jansa@gmail.com>
In-Reply-To: <20211103085123.694138-1-Martin.Jansa@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 3 Nov 2021 10:05:47 -0400
Message-ID: <CADkTA4OOiaUFpmupySU5Bks=brTEd=ptxrLxTq5tCPykg53ftw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] global: convert github SRC_URIs to use https protocol
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000d6382105cfe2e867"

--000000000000d6382105cfe2e867
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 3, 2021 at 4:51 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:

> * apply the same also for recipes using PKG_NAME starting
>   with github.com which the conversion script doesn't update
>   automatically
>
>
Thans Martin,

I've added these to the patches that I did, and pushed them to master.

I've also pulled variants of them back to honster and dunfell (so anyone
using those branches, let me know if there are other missing recipes, or if
something breaks).

Bruce



> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-containers/go-digest/go-digest_git.bb               | 2 +-
>  recipes-containers/go-errors/go-errors_git.bb               | 2 +-
>  recipes-containers/go-spf13-cobra/spf13-cobra_git.bb        | 2 +-
>  recipes-containers/go-spf13-pflag/spf13-pflag_git.bb        | 2 +-
>  recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb | 2 +-
>  recipes-devtools/go/compose-file_git.bb                     | 2 +-
>  recipes-devtools/go/go-capability_git.bb                    | 2 +-
>  recipes-devtools/go/go-cli_git.bb                           | 2 +-
>  recipes-devtools/go/go-connections_git.bb                   | 2 +-
>  recipes-devtools/go/go-context_git.bb                       | 2 +-
>  recipes-devtools/go/go-dbus_git.bb                          | 2 +-
>  recipes-devtools/go/go-fsnotify_git.bb                      | 2 +-
>  recipes-devtools/go/go-libtrust_git.bb                      | 2 +-
>  recipes-devtools/go/go-logrus_git.bb                        | 2 +-
>  recipes-devtools/go/go-metalinter_git.bb                    | 2 +-
>  recipes-devtools/go/go-mux_git.bb                           | 2 +-
>  recipes-devtools/go/go-patricia_git.bb                      | 2 +-
>  recipes-devtools/go/go-pty_git.bb                           | 2 +-
>  recipes-devtools/go/notary_git.bb                           | 2 +-
>  19 files changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/recipes-containers/go-digest/go-digest_git.bb
> b/recipes-containers/go-digest/go-digest_git.bb
> index 3966fac..c06a142 100644
> --- a/recipes-containers/go-digest/go-digest_git.bb
> +++ b/recipes-containers/go-digest/go-digest_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =
> "file://src/${PKG_NAME}/LICENSE.code;md5=9cd86830b557232ce55e
>  SRCNAME = "go-digest"
>
>  PKG_NAME = "github.com/opencontainers/${SRCNAME}
> <http://github.com/opencontainers/$%7BSRCNAME%7D>"
> -SRC_URI =
> "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master"
> +SRC_URI =
> "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
>
>  SRCREV = "b6234c321f263c503268e3b205f3d9755f9d14ed"
>  PV = "v1.0.0-rc0+git${SRCPV}"
> diff --git a/recipes-containers/go-errors/go-errors_git.bb
> b/recipes-containers/go-errors/go-errors_git.bb
> index d7b3287..f1d7ef3 100644
> --- a/recipes-containers/go-errors/go-errors_git.bb
> +++ b/recipes-containers/go-errors/go-errors_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =
> "file://src/${PKG_NAME}/LICENSE;md5=6fe682a02df52c6653f33bd0f
>  SRCNAME = "errors"
>
>  PKG_NAME = "github.com/pkg/${SRCNAME}
> <http://github.com/pkg/$%7BSRCNAME%7D>"
> -SRC_URI =
> "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master"
> +SRC_URI =
> "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
>
>  SRCREV = "5dd12d0cfe7f152f80558d591504ce685299311e"
>  PV = "v0.8.1+git${SRCPV}"
> diff --git a/recipes-containers/go-spf13-cobra/spf13-cobra_git.bb
> b/recipes-containers/go-spf13-cobra/spf13-cobra_git.bb
> index 697ba4e..b272f16 100644
> --- a/recipes-containers/go-spf13-cobra/spf13-cobra_git.bb
> +++ b/recipes-containers/go-spf13-cobra/spf13-cobra_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =
> "file://src/${PKG_NAME}/LICENSE.txt;md5=920d76114a32b0fb75b3f
>  SRCNAME = "cobra"
>
>  PKG_NAME = "github.com/spf13/${SRCNAME}
> <http://github.com/spf13/$%7BSRCNAME%7D>"
> -SRC_URI =
> "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master"
> +SRC_URI =
> "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
>
>  SRCREV = "b5d8e8f46a2f829f755b6e33b454e25c61c935e1"
>  PV = "v0.0.1+git${SRCPV}"
> diff --git a/recipes-containers/go-spf13-pflag/spf13-pflag_git.bb
> b/recipes-containers/go-spf13-pflag/spf13-pflag_git.bb
> index c4c374e..ea63029 100644
> --- a/recipes-containers/go-spf13-pflag/spf13-pflag_git.bb
> +++ b/recipes-containers/go-spf13-pflag/spf13-pflag_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =
> "file://src/${PKG_NAME}/LICENSE;md5=1e8b7dc8b906737639131047a
>  SRCNAME = "pflag"
>
>  PKG_NAME = "github.com/spf13/${SRCNAME}
> <http://github.com/spf13/$%7BSRCNAME%7D>"
> -SRC_URI =
> "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master"
> +SRC_URI =
> "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
>
>  SRCREV = "d5e0c0615acee7028e1e2740a11102313be88de1"
>  PV = "v1.0.5+git${SRCPV}"
> diff --git a/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb
> b/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb
> index d30868c..64354f9 100644
> --- a/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb
> +++ b/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =
> "file://src/${PKG_NAME}/LICENSE;md5=b355a61a394a504dacde901c9
>  SRCNAME = "runtime-spec"
>
>  PKG_NAME = "github.com/opencontainers/${SRCNAME}
> <http://github.com/opencontainers/$%7BSRCNAME%7D>"
> -SRC_URI =
> "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master"
> +SRC_URI =
> "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
>
>  SRCREV = "ab23082b188344f6fbb63a441ea00ffc2852d06d"
>  PV = "v1.0.2+git${SRCPV}"
> diff --git a/recipes-devtools/go/compose-file_git.bb
> b/recipes-devtools/go/compose-file_git.bb
> index 1571265..c33a7ac 100644
> --- a/recipes-devtools/go/compose-file_git.bb
> +++ b/recipes-devtools/go/compose-file_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =
> "file://src/${PKG_NAME}/LICENSE;md5=9cd86830b557232ce55e2a6b4
>  SRCNAME = "compose-file"
>
>  PKG_NAME = "github.com/aanand/${SRCNAME}
> <http://github.com/aanand/$%7BSRCNAME%7D>"
> -SRC_URI =
> "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master"
> +SRC_URI =
> "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
>
>  SRCREV = "a3e58764f50597b6217fec07e9bff7225c4a1719"
>  PV = "3.0+git${SRCPV}"
> diff --git a/recipes-devtools/go/go-capability_git.bb
> b/recipes-devtools/go/go-capability_git.bb
> index 5c180e7..7e5ab11 100644
> --- a/recipes-devtools/go/go-capability_git.bb
> +++ b/recipes-devtools/go/go-capability_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=a7304f5073e7be4ba7bffabbf9f2bbca"
>  SRCNAME = "gocapability"
>
>  PKG_NAME = "github.com/syndtr/${SRCNAME}
> <http://github.com/syndtr/$%7BSRCNAME%7D>"
> -SRC_URI = "git://${PKG_NAME}.git;branch=master"
> +SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
>
>  SRCREV = "2c00daeb6c3b45114c80ac44119e7b8801fdd852"
>  PV = "0.0+git${SRCPV}"
> diff --git a/recipes-devtools/go/go-cli_git.bb b/recipes-devtools/go/
> go-cli_git.bb
> index 7db5fc5..ae67f8e 100644
> --- a/recipes-devtools/go/go-cli_git.bb
> +++ b/recipes-devtools/go/go-cli_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=ed9b539ed65d73926f30ff1f1587dc44"
>  SRCNAME = "cli"
>
>  PKG_NAME = "github.com/codegangsta/${SRCNAME}
> <http://github.com/codegangsta/$%7BSRCNAME%7D>"
> -SRC_URI = "git://${PKG_NAME}.git;branch=master"
> +SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
>
>  SRCREV = "27ecc97192df1bf053a22b04463f2b51b8b8373e"
>  PV = "1.1.0+git${SRCPV}"
> diff --git a/recipes-devtools/go/go-connections_git.bb
> b/recipes-devtools/go/go-connections_git.bb
> index 1bf6e94..ebfdb9f 100644
> --- a/recipes-devtools/go/go-connections_git.bb
> +++ b/recipes-devtools/go/go-connections_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =
> "file://src/${PKG_NAME}/LICENSE;md5=04424bc6f5a5be60691b9824d
>  SRCNAME = "go-connections"
>
>  PKG_NAME = "github.com/docker/${SRCNAME}
> <http://github.com/docker/$%7BSRCNAME%7D>"
> -SRC_URI =
> "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master"
> +SRC_URI =
> "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
>
>  SRCREV = "4ccf312bf1d35e5dbda654e57a9be4c3f3cd0366"
>  PV = "0.2.1+git${SRCPV}"
> diff --git a/recipes-devtools/go/go-context_git.bb b/recipes-devtools/go/
> go-context_git.bb
> index ba0368b..37f39b3 100644
> --- a/recipes-devtools/go/go-context_git.bb
> +++ b/recipes-devtools/go/go-context_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=c50f6bd9c1e15ed0bad3bea18e3c1b7f"
>  SRCNAME = "context"
>
>  PKG_NAME = "github.com/gorilla/${SRCNAME}
> <http://github.com/gorilla/$%7BSRCNAME%7D>"
> -SRC_URI = "git://${PKG_NAME}.git;branch=master"
> +SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
>
>  SRCREV = "14f550f51af52180c2eefed15e5fd18d63c0a64a"
>
> diff --git a/recipes-devtools/go/go-dbus_git.bb b/recipes-devtools/go/
> go-dbus_git.bb
> index 39b14a5..4bf44d6 100644
> --- a/recipes-devtools/go/go-dbus_git.bb
> +++ b/recipes-devtools/go/go-dbus_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=09042bd5c6c96a2b9e45ddf1bc517eed"
>  SRCNAME = "dbus"
>
>  PKG_NAME = "github.com/godbus/${SRCNAME}
> <http://github.com/godbus/$%7BSRCNAME%7D>"
> -SRC_URI = "git://${PKG_NAME}.git;branch=master"
> +SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
>
>  SRCREV = "5f6efc7ef2759c81b7ba876593971bfce311eab3"
>  PV = "4.0.0+git${SRCPV}"
> diff --git a/recipes-devtools/go/go-fsnotify_git.bb b/recipes-devtools/go/
> go-fsnotify_git.bb
> index 2ae27b1..8aa1c76 100644
> --- a/recipes-devtools/go/go-fsnotify_git.bb
> +++ b/recipes-devtools/go/go-fsnotify_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=c38914c9a7ab03bb2b96d4baaee10769"
>  SRCNAME = "fsnotify"
>
>  PKG_NAME = "github.com/fsnotify/${SRCNAME}
> <http://github.com/fsnotify/$%7BSRCNAME%7D>"
> -SRC_URI = "git://${PKG_NAME}.git;branch=master"
> +SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
>
>  SRCREV = "836bfd95fecc0f1511dd66bdbf2b5b61ab8b00b6"
>  PV = "1.2.11+git${SRCPV}"
> diff --git a/recipes-devtools/go/go-libtrust_git.bb b/recipes-devtools/go/
> go-libtrust_git.bb
> index 404baf5..e2a28ec 100644
> --- a/recipes-devtools/go/go-libtrust_git.bb
> +++ b/recipes-devtools/go/go-libtrust_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
>  SRCNAME = "libtrust"
>
>  PKG_NAME = "github.com/docker/${SRCNAME}
> <http://github.com/docker/$%7BSRCNAME%7D>"
> -SRC_URI = "git://${PKG_NAME}.git;branch=master"
> +SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
>
>  SRCREV = "9cbd2a1374f46905c68a4eb3694a130610adc62a"
>  PV = "0.0+git${SRCPV}"
> diff --git a/recipes-devtools/go/go-logrus_git.bb b/recipes-devtools/go/
> go-logrus_git.bb
> index b54b32b..2c59d34 100644
> --- a/recipes-devtools/go/go-logrus_git.bb
> +++ b/recipes-devtools/go/go-logrus_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=8dadfef729c08ec4e631c4f6fc5d43a0"
>  SRCNAME = "logrus"
>
>  PKG_NAME = "github.com/Sirupsen/${SRCNAME}
> <http://github.com/Sirupsen/$%7BSRCNAME%7D>"
> -SRC_URI = "git://${PKG_NAME}.git;branch=master"
> +SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
>
>  SRCREV = "d26492970760ca5d33129d2d799e34be5c4782eb"
>  PV = "0.11.0+git${SRCPV}"
> diff --git a/recipes-devtools/go/go-metalinter_git.bb
> b/recipes-devtools/go/go-metalinter_git.bb
> index 3bef3b5..3dda45c 100644
> --- a/recipes-devtools/go/go-metalinter_git.bb
> +++ b/recipes-devtools/go/go-metalinter_git.bb
> @@ -9,7 +9,7 @@ BBCLASSEXTEND = "native"
>  SRCNAME = "gometalinter"
>
>  PKG_NAME = "github.com/alecthomas/${SRCNAME}
> <http://github.com/alecthomas/$%7BSRCNAME%7D>"
> -SRC_URI = "git://${PKG_NAME}.git;branch=master"
> +SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
>
>  SRCREV = "e8d801238da6f0dfd14078d68f9b53fa50a7eeb5"
>  PV = "0.0+git${SRCPV}"
> diff --git a/recipes-devtools/go/go-mux_git.bb b/recipes-devtools/go/
> go-mux_git.bb
> index c0db050..3f939f4 100644
> --- a/recipes-devtools/go/go-mux_git.bb
> +++ b/recipes-devtools/go/go-mux_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=c50f6bd9c1e15ed0bad3bea18e3c1b7f"
>  SRCNAME = "mux"
>
>  PKG_NAME = "github.com/gorilla/${SRCNAME}
> <http://github.com/gorilla/$%7BSRCNAME%7D>"
> -SRC_URI = "git://${PKG_NAME}.git;branch=master"
> +SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
>
>  SRCREV = "136d54f81f00414c45c3c68dd47e98cc97519c5e"
>
> diff --git a/recipes-devtools/go/go-patricia_git.bb b/recipes-devtools/go/
> go-patricia_git.bb
> index 1098560..4c29b57 100644
> --- a/recipes-devtools/go/go-patricia_git.bb
> +++ b/recipes-devtools/go/go-patricia_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=9949b99212edd6b1e24ce702376c3baf"
>  SRCNAME = "go-patricia"
>
>  PKG_NAME = "github.com/tchap/${SRCNAME}
> <http://github.com/tchap/$%7BSRCNAME%7D>"
> -SRC_URI = "git://${PKG_NAME}.git;branch=master"
> +SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
>
>  SRCREV = "666120de432aea38ab06bd5c818f04f4129882c9"
>  PV = "2.2.6+git${SRCPV}"
> diff --git a/recipes-devtools/go/go-pty_git.bb b/recipes-devtools/go/
> go-pty_git.bb
> index 0baa70d..132e82d 100644
> --- a/recipes-devtools/go/go-pty_git.bb
> +++ b/recipes-devtools/go/go-pty_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =
> "file://License;md5=93958070863d769117fa33b129020050"
>  SRCNAME = "pty"
>
>  PKG_NAME = "github.com/creack/${SRCNAME}
> <http://github.com/creack/$%7BSRCNAME%7D>"
> -SRC_URI = "git://${PKG_NAME}.git;branch=master"
> +SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
>
>  SRCREV = "05017fcccf23c823bfdea560dcc958a136e54fb7"
>
> diff --git a/recipes-devtools/go/notary_git.bb b/recipes-devtools/go/
> notary_git.bb
> index 3e908a0..972da5e 100644
> --- a/recipes-devtools/go/notary_git.bb
> +++ b/recipes-devtools/go/notary_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =
> "file://src/${PKG_NAME}/LICENSE;md5=3596b980bb036e0875174ed15
>  SRCNAME = "notary"
>
>  PKG_NAME = "github.com/docker/${SRCNAME}
> <http://github.com/docker/$%7BSRCNAME%7D>"
> -SRC_URI =
> "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master"
> +SRC_URI =
> "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
>
>  SRCREV = "d6e1431feb32348e0650bf7551ac5cffd01d857b"
>  PV = "0.6.1+git${SRCPV}"
> --
> 2.32.0
>
>
> 
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000d6382105cfe2e867
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Nov 3, 2021 at 4:51 AM Martin Jansa &lt;<a =
href=3D"mailto:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">* apply the sa=
me also for recipes using PKG_NAME starting<br>
=C2=A0 with <a href=3D"http://github.com" rel=3D"noreferrer" target=3D"_bla=
nk">github.com</a> which the conversion script doesn&#39;t update<br>
=C2=A0 automatically<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">Thans Martin,</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:s=
mall">I&#39;ve added these to the patches that I did, and pushed them to ma=
ster.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div=
><div class=3D"gmail_default" style=3D"font-size:small">I&#39;ve also pulle=
d variants of them back to honster and dunfell (so anyone using those branc=
hes, let me know if there are other missing recipes, or if something breaks=
).</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><d=
iv class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" t=
arget=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/go-digest/<a href=3D"http://go-digest_git.bb" rel=
=3D"noreferrer" target=3D"_blank">go-digest_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0recipes-containers/go-errors/<a href=3D"http://go-errors_git.bb" rel=
=3D"noreferrer" target=3D"_blank">go-errors_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0recipes-containers/go-spf13-cobra/<a href=3D"http://spf13-cobra_git.b=
b" rel=3D"noreferrer" target=3D"_blank">spf13-cobra_git.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0recipes-containers/go-spf13-pflag/<a href=3D"http://spf13-pflag_git.b=
b" rel=3D"noreferrer" target=3D"_blank">spf13-pflag_git.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0recipes-containers/oci-runtime-spec/<a href=3D"http://oci-runtime-spe=
c_git.bb" rel=3D"noreferrer" target=3D"_blank">oci-runtime-spec_git.bb</a> =
| 2 +-<br>
=C2=A0recipes-devtools/go/<a href=3D"http://compose-file_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">compose-file_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0recipes-devtools/go/<a href=3D"http://go-capability_git.bb" rel=3D"no=
referrer" target=3D"_blank">go-capability_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0recipes-devtools/go/<a href=3D"http://go-cli_git.bb" rel=3D"noreferre=
r" target=3D"_blank">go-cli_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0recipes-devtools/go/<a href=3D"http://go-connections_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">go-connections_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0recipes-devtools/go/<a href=3D"http://go-context_git.bb" rel=3D"noref=
errer" target=3D"_blank">go-context_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0recipes-devtools/go/<a href=3D"http://go-dbus_git.bb" rel=3D"noreferr=
er" target=3D"_blank">go-dbus_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0recipes-devtools/go/<a href=3D"http://go-fsnotify_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">go-fsnotify_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0recipes-devtools/go/<a href=3D"http://go-libtrust_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">go-libtrust_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0recipes-devtools/go/<a href=3D"http://go-logrus_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">go-logrus_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0recipes-devtools/go/<a href=3D"http://go-metalinter_git.bb" rel=3D"no=
referrer" target=3D"_blank">go-metalinter_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0recipes-devtools/go/<a href=3D"http://go-mux_git.bb" rel=3D"noreferre=
r" target=3D"_blank">go-mux_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0recipes-devtools/go/<a href=3D"http://go-patricia_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">go-patricia_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0recipes-devtools/go/<a href=3D"http://go-pty_git.bb" rel=3D"noreferre=
r" target=3D"_blank">go-pty_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0recipes-devtools/go/<a href=3D"http://notary_git.bb" rel=3D"noreferre=
r" target=3D"_blank">notary_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A019 files changed, 19 insertions(+), 19 deletions(-)<br>
<br>
diff --git a/recipes-containers/go-digest/<a href=3D"http://go-digest_git.b=
b" rel=3D"noreferrer" target=3D"_blank">go-digest_git.bb</a> b/recipes-cont=
ainers/go-digest/<a href=3D"http://go-digest_git.bb" rel=3D"noreferrer" tar=
get=3D"_blank">go-digest_git.bb</a><br>
index 3966fac..c06a142 100644<br>
--- a/recipes-containers/go-digest/<a href=3D"http://go-digest_git.bb" rel=
=3D"noreferrer" target=3D"_blank">go-digest_git.bb</a><br>
+++ b/recipes-containers/go-digest/<a href=3D"http://go-digest_git.bb" rel=
=3D"noreferrer" target=3D"_blank">go-digest_git.bb</a><br>
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://src/${PKG_NAME}/LICENSE.c=
ode;md5=3D9cd86830b557232ce55e<br>
=C2=A0SRCNAME =3D &quot;go-digest&quot;<br>
<br>
=C2=A0PKG_NAME =3D &quot;<a href=3D"http://github.com/opencontainers/$%7BSR=
CNAME%7D" rel=3D"noreferrer" target=3D"_blank">github.com/opencontainers/${=
SRCNAME}</a>&quot;<br>
-SRC_URI =3D &quot;git://${PKG_NAME}.git;destsuffix=3Dgit/src/${PKG_NAME};b=
ranch=3Dmaster&quot;<br>
+SRC_URI =3D &quot;git://${PKG_NAME}.git;destsuffix=3Dgit/src/${PKG_NAME};b=
ranch=3Dmaster;protocol=3Dhttps&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;b6234c321f263c503268e3b205f3d9755f9d14ed&quot;<br>
=C2=A0PV =3D &quot;v1.0.0-rc0+git${SRCPV}&quot;<br>
diff --git a/recipes-containers/go-errors/<a href=3D"http://go-errors_git.b=
b" rel=3D"noreferrer" target=3D"_blank">go-errors_git.bb</a> b/recipes-cont=
ainers/go-errors/<a href=3D"http://go-errors_git.bb" rel=3D"noreferrer" tar=
get=3D"_blank">go-errors_git.bb</a><br>
index d7b3287..f1d7ef3 100644<br>
--- a/recipes-containers/go-errors/<a href=3D"http://go-errors_git.bb" rel=
=3D"noreferrer" target=3D"_blank">go-errors_git.bb</a><br>
+++ b/recipes-containers/go-errors/<a href=3D"http://go-errors_git.bb" rel=
=3D"noreferrer" target=3D"_blank">go-errors_git.bb</a><br>
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://src/${PKG_NAME}/LICENSE;m=
d5=3D6fe682a02df52c6653f33bd0f<br>
=C2=A0SRCNAME =3D &quot;errors&quot;<br>
<br>
=C2=A0PKG_NAME =3D &quot;<a href=3D"http://github.com/pkg/$%7BSRCNAME%7D" r=
el=3D"noreferrer" target=3D"_blank">github.com/pkg/${SRCNAME}</a>&quot;<br>
-SRC_URI =3D &quot;git://${PKG_NAME}.git;destsuffix=3Dgit/src/${PKG_NAME};b=
ranch=3Dmaster&quot;<br>
+SRC_URI =3D &quot;git://${PKG_NAME}.git;destsuffix=3Dgit/src/${PKG_NAME};b=
ranch=3Dmaster;protocol=3Dhttps&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;5dd12d0cfe7f152f80558d591504ce685299311e&quot;<br>
=C2=A0PV =3D &quot;v0.8.1+git${SRCPV}&quot;<br>
diff --git a/recipes-containers/go-spf13-cobra/<a href=3D"http://spf13-cobr=
a_git.bb" rel=3D"noreferrer" target=3D"_blank">spf13-cobra_git.bb</a> b/rec=
ipes-containers/go-spf13-cobra/<a href=3D"http://spf13-cobra_git.bb" rel=3D=
"noreferrer" target=3D"_blank">spf13-cobra_git.bb</a><br>
index 697ba4e..b272f16 100644<br>
--- a/recipes-containers/go-spf13-cobra/<a href=3D"http://spf13-cobra_git.b=
b" rel=3D"noreferrer" target=3D"_blank">spf13-cobra_git.bb</a><br>
+++ b/recipes-containers/go-spf13-cobra/<a href=3D"http://spf13-cobra_git.b=
b" rel=3D"noreferrer" target=3D"_blank">spf13-cobra_git.bb</a><br>
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://src/${PKG_NAME}/LICENSE.t=
xt;md5=3D920d76114a32b0fb75b3f<br>
=C2=A0SRCNAME =3D &quot;cobra&quot;<br>
<br>
=C2=A0PKG_NAME =3D &quot;<a href=3D"http://github.com/spf13/$%7BSRCNAME%7D"=
 rel=3D"noreferrer" target=3D"_blank">github.com/spf13/${SRCNAME}</a>&quot;=
<br>
-SRC_URI =3D &quot;git://${PKG_NAME}.git;destsuffix=3Dgit/src/${PKG_NAME};b=
ranch=3Dmaster&quot;<br>
+SRC_URI =3D &quot;git://${PKG_NAME}.git;destsuffix=3Dgit/src/${PKG_NAME};b=
ranch=3Dmaster;protocol=3Dhttps&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;b5d8e8f46a2f829f755b6e33b454e25c61c935e1&quot;<br>
=C2=A0PV =3D &quot;v0.0.1+git${SRCPV}&quot;<br>
diff --git a/recipes-containers/go-spf13-pflag/<a href=3D"http://spf13-pfla=
g_git.bb" rel=3D"noreferrer" target=3D"_blank">spf13-pflag_git.bb</a> b/rec=
ipes-containers/go-spf13-pflag/<a href=3D"http://spf13-pflag_git.bb" rel=3D=
"noreferrer" target=3D"_blank">spf13-pflag_git.bb</a><br>
index c4c374e..ea63029 100644<br>
--- a/recipes-containers/go-spf13-pflag/<a href=3D"http://spf13-pflag_git.b=
b" rel=3D"noreferrer" target=3D"_blank">spf13-pflag_git.bb</a><br>
+++ b/recipes-containers/go-spf13-pflag/<a href=3D"http://spf13-pflag_git.b=
b" rel=3D"noreferrer" target=3D"_blank">spf13-pflag_git.bb</a><br>
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://src/${PKG_NAME}/LICENSE;m=
d5=3D1e8b7dc8b906737639131047a<br>
=C2=A0SRCNAME =3D &quot;pflag&quot;<br>
<br>
=C2=A0PKG_NAME =3D &quot;<a href=3D"http://github.com/spf13/$%7BSRCNAME%7D"=
 rel=3D"noreferrer" target=3D"_blank">github.com/spf13/${SRCNAME}</a>&quot;=
<br>
-SRC_URI =3D &quot;git://${PKG_NAME}.git;destsuffix=3Dgit/src/${PKG_NAME};b=
ranch=3Dmaster&quot;<br>
+SRC_URI =3D &quot;git://${PKG_NAME}.git;destsuffix=3Dgit/src/${PKG_NAME};b=
ranch=3Dmaster;protocol=3Dhttps&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;d5e0c0615acee7028e1e2740a11102313be88de1&quot;<br>
=C2=A0PV =3D &quot;v1.0.5+git${SRCPV}&quot;<br>
diff --git a/recipes-containers/oci-runtime-spec/<a href=3D"http://oci-runt=
ime-spec_git.bb" rel=3D"noreferrer" target=3D"_blank">oci-runtime-spec_git.=
bb</a> b/recipes-containers/oci-runtime-spec/<a href=3D"http://oci-runtime-=
spec_git.bb" rel=3D"noreferrer" target=3D"_blank">oci-runtime-spec_git.bb</=
a><br>
index d30868c..64354f9 100644<br>
--- a/recipes-containers/oci-runtime-spec/<a href=3D"http://oci-runtime-spe=
c_git.bb" rel=3D"noreferrer" target=3D"_blank">oci-runtime-spec_git.bb</a><=
br>
+++ b/recipes-containers/oci-runtime-spec/<a href=3D"http://oci-runtime-spe=
c_git.bb" rel=3D"noreferrer" target=3D"_blank">oci-runtime-spec_git.bb</a><=
br>
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://src/${PKG_NAME}/LICENSE;m=
d5=3Db355a61a394a504dacde901c9<br>
=C2=A0SRCNAME =3D &quot;runtime-spec&quot;<br>
<br>
=C2=A0PKG_NAME =3D &quot;<a href=3D"http://github.com/opencontainers/$%7BSR=
CNAME%7D" rel=3D"noreferrer" target=3D"_blank">github.com/opencontainers/${=
SRCNAME}</a>&quot;<br>
-SRC_URI =3D &quot;git://${PKG_NAME}.git;destsuffix=3Dgit/src/${PKG_NAME};b=
ranch=3Dmaster&quot;<br>
+SRC_URI =3D &quot;git://${PKG_NAME}.git;destsuffix=3Dgit/src/${PKG_NAME};b=
ranch=3Dmaster;protocol=3Dhttps&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;ab23082b188344f6fbb63a441ea00ffc2852d06d&quot;<br>
=C2=A0PV =3D &quot;v1.0.2+git${SRCPV}&quot;<br>
diff --git a/recipes-devtools/go/<a href=3D"http://compose-file_git.bb" rel=
=3D"noreferrer" target=3D"_blank">compose-file_git.bb</a> b/recipes-devtool=
s/go/<a href=3D"http://compose-file_git.bb" rel=3D"noreferrer" target=3D"_b=
lank">compose-file_git.bb</a><br>
index 1571265..c33a7ac 100644<br>
--- a/recipes-devtools/go/<a href=3D"http://compose-file_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">compose-file_git.bb</a><br>
+++ b/recipes-devtools/go/<a href=3D"http://compose-file_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">compose-file_git.bb</a><br>
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://src/${PKG_NAME}/LICENSE;m=
d5=3D9cd86830b557232ce55e2a6b4<br>
=C2=A0SRCNAME =3D &quot;compose-file&quot;<br>
<br>
=C2=A0PKG_NAME =3D &quot;<a href=3D"http://github.com/aanand/$%7BSRCNAME%7D=
" rel=3D"noreferrer" target=3D"_blank">github.com/aanand/${SRCNAME}</a>&quo=
t;<br>
-SRC_URI =3D &quot;git://${PKG_NAME}.git;destsuffix=3Dgit/src/${PKG_NAME};b=
ranch=3Dmaster&quot;<br>
+SRC_URI =3D &quot;git://${PKG_NAME}.git;destsuffix=3Dgit/src/${PKG_NAME};b=
ranch=3Dmaster;protocol=3Dhttps&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;a3e58764f50597b6217fec07e9bff7225c4a1719&quot;<br>
=C2=A0PV =3D &quot;3.0+git${SRCPV}&quot;<br>
diff --git a/recipes-devtools/go/<a href=3D"http://go-capability_git.bb" re=
l=3D"noreferrer" target=3D"_blank">go-capability_git.bb</a> b/recipes-devto=
ols/go/<a href=3D"http://go-capability_git.bb" rel=3D"noreferrer" target=3D=
"_blank">go-capability_git.bb</a><br>
index 5c180e7..7e5ab11 100644<br>
--- a/recipes-devtools/go/<a href=3D"http://go-capability_git.bb" rel=3D"no=
referrer" target=3D"_blank">go-capability_git.bb</a><br>
+++ b/recipes-devtools/go/<a href=3D"http://go-capability_git.bb" rel=3D"no=
referrer" target=3D"_blank">go-capability_git.bb</a><br>
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Da7304f5073e=
7be4ba7bffabbf9f2bbca&quot;<br>
=C2=A0SRCNAME =3D &quot;gocapability&quot;<br>
<br>
=C2=A0PKG_NAME =3D &quot;<a href=3D"http://github.com/syndtr/$%7BSRCNAME%7D=
" rel=3D"noreferrer" target=3D"_blank">github.com/syndtr/${SRCNAME}</a>&quo=
t;<br>
-SRC_URI =3D &quot;git://${PKG_NAME}.git;branch=3Dmaster&quot;<br>
+SRC_URI =3D &quot;git://${PKG_NAME}.git;branch=3Dmaster;protocol=3Dhttps&q=
uot;<br>
<br>
=C2=A0SRCREV =3D &quot;2c00daeb6c3b45114c80ac44119e7b8801fdd852&quot;<br>
=C2=A0PV =3D &quot;0.0+git${SRCPV}&quot;<br>
diff --git a/recipes-devtools/go/<a href=3D"http://go-cli_git.bb" rel=3D"no=
referrer" target=3D"_blank">go-cli_git.bb</a> b/recipes-devtools/go/<a href=
=3D"http://go-cli_git.bb" rel=3D"noreferrer" target=3D"_blank">go-cli_git.b=
b</a><br>
index 7db5fc5..ae67f8e 100644<br>
--- a/recipes-devtools/go/<a href=3D"http://go-cli_git.bb" rel=3D"noreferre=
r" target=3D"_blank">go-cli_git.bb</a><br>
+++ b/recipes-devtools/go/<a href=3D"http://go-cli_git.bb" rel=3D"noreferre=
r" target=3D"_blank">go-cli_git.bb</a><br>
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Ded9b539ed65=
d73926f30ff1f1587dc44&quot;<br>
=C2=A0SRCNAME =3D &quot;cli&quot;<br>
<br>
=C2=A0PKG_NAME =3D &quot;<a href=3D"http://github.com/codegangsta/$%7BSRCNA=
ME%7D" rel=3D"noreferrer" target=3D"_blank">github.com/codegangsta/${SRCNAM=
E}</a>&quot;<br>
-SRC_URI =3D &quot;git://${PKG_NAME}.git;branch=3Dmaster&quot;<br>
+SRC_URI =3D &quot;git://${PKG_NAME}.git;branch=3Dmaster;protocol=3Dhttps&q=
uot;<br>
<br>
=C2=A0SRCREV =3D &quot;27ecc97192df1bf053a22b04463f2b51b8b8373e&quot;<br>
=C2=A0PV =3D &quot;1.1.0+git${SRCPV}&quot;<br>
diff --git a/recipes-devtools/go/<a href=3D"http://go-connections_git.bb" r=
el=3D"noreferrer" target=3D"_blank">go-connections_git.bb</a> b/recipes-dev=
tools/go/<a href=3D"http://go-connections_git.bb" rel=3D"noreferrer" target=
=3D"_blank">go-connections_git.bb</a><br>
index 1bf6e94..ebfdb9f 100644<br>
--- a/recipes-devtools/go/<a href=3D"http://go-connections_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">go-connections_git.bb</a><br>
+++ b/recipes-devtools/go/<a href=3D"http://go-connections_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">go-connections_git.bb</a><br>
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://src/${PKG_NAME}/LICENSE;m=
d5=3D04424bc6f5a5be60691b9824d<br>
=C2=A0SRCNAME =3D &quot;go-connections&quot;<br>
<br>
=C2=A0PKG_NAME =3D &quot;<a href=3D"http://github.com/docker/$%7BSRCNAME%7D=
" rel=3D"noreferrer" target=3D"_blank">github.com/docker/${SRCNAME}</a>&quo=
t;<br>
-SRC_URI =3D &quot;git://${PKG_NAME}.git;destsuffix=3Dgit/src/${PKG_NAME};b=
ranch=3Dmaster&quot;<br>
+SRC_URI =3D &quot;git://${PKG_NAME}.git;destsuffix=3Dgit/src/${PKG_NAME};b=
ranch=3Dmaster;protocol=3Dhttps&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;4ccf312bf1d35e5dbda654e57a9be4c3f3cd0366&quot;<br>
=C2=A0PV =3D &quot;0.2.1+git${SRCPV}&quot;<br>
diff --git a/recipes-devtools/go/<a href=3D"http://go-context_git.bb" rel=
=3D"noreferrer" target=3D"_blank">go-context_git.bb</a> b/recipes-devtools/=
go/<a href=3D"http://go-context_git.bb" rel=3D"noreferrer" target=3D"_blank=
">go-context_git.bb</a><br>
index ba0368b..37f39b3 100644<br>
--- a/recipes-devtools/go/<a href=3D"http://go-context_git.bb" rel=3D"noref=
errer" target=3D"_blank">go-context_git.bb</a><br>
+++ b/recipes-devtools/go/<a href=3D"http://go-context_git.bb" rel=3D"noref=
errer" target=3D"_blank">go-context_git.bb</a><br>
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dc50f6bd9c1e=
15ed0bad3bea18e3c1b7f&quot;<br>
=C2=A0SRCNAME =3D &quot;context&quot;<br>
<br>
=C2=A0PKG_NAME =3D &quot;<a href=3D"http://github.com/gorilla/$%7BSRCNAME%7=
D" rel=3D"noreferrer" target=3D"_blank">github.com/gorilla/${SRCNAME}</a>&q=
uot;<br>
-SRC_URI =3D &quot;git://${PKG_NAME}.git;branch=3Dmaster&quot;<br>
+SRC_URI =3D &quot;git://${PKG_NAME}.git;branch=3Dmaster;protocol=3Dhttps&q=
uot;<br>
<br>
=C2=A0SRCREV =3D &quot;14f550f51af52180c2eefed15e5fd18d63c0a64a&quot;<br>
<br>
diff --git a/recipes-devtools/go/<a href=3D"http://go-dbus_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">go-dbus_git.bb</a> b/recipes-devtools/go/<a hr=
ef=3D"http://go-dbus_git.bb" rel=3D"noreferrer" target=3D"_blank">go-dbus_g=
it.bb</a><br>
index 39b14a5..4bf44d6 100644<br>
--- a/recipes-devtools/go/<a href=3D"http://go-dbus_git.bb" rel=3D"noreferr=
er" target=3D"_blank">go-dbus_git.bb</a><br>
+++ b/recipes-devtools/go/<a href=3D"http://go-dbus_git.bb" rel=3D"noreferr=
er" target=3D"_blank">go-dbus_git.bb</a><br>
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D09042bd5c6c=
96a2b9e45ddf1bc517eed&quot;<br>
=C2=A0SRCNAME =3D &quot;dbus&quot;<br>
<br>
=C2=A0PKG_NAME =3D &quot;<a href=3D"http://github.com/godbus/$%7BSRCNAME%7D=
" rel=3D"noreferrer" target=3D"_blank">github.com/godbus/${SRCNAME}</a>&quo=
t;<br>
-SRC_URI =3D &quot;git://${PKG_NAME}.git;branch=3Dmaster&quot;<br>
+SRC_URI =3D &quot;git://${PKG_NAME}.git;branch=3Dmaster;protocol=3Dhttps&q=
uot;<br>
<br>
=C2=A0SRCREV =3D &quot;5f6efc7ef2759c81b7ba876593971bfce311eab3&quot;<br>
=C2=A0PV =3D &quot;4.0.0+git${SRCPV}&quot;<br>
diff --git a/recipes-devtools/go/<a href=3D"http://go-fsnotify_git.bb" rel=
=3D"noreferrer" target=3D"_blank">go-fsnotify_git.bb</a> b/recipes-devtools=
/go/<a href=3D"http://go-fsnotify_git.bb" rel=3D"noreferrer" target=3D"_bla=
nk">go-fsnotify_git.bb</a><br>
index 2ae27b1..8aa1c76 100644<br>
--- a/recipes-devtools/go/<a href=3D"http://go-fsnotify_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">go-fsnotify_git.bb</a><br>
+++ b/recipes-devtools/go/<a href=3D"http://go-fsnotify_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">go-fsnotify_git.bb</a><br>
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dc38914c9a7a=
b03bb2b96d4baaee10769&quot;<br>
=C2=A0SRCNAME =3D &quot;fsnotify&quot;<br>
<br>
=C2=A0PKG_NAME =3D &quot;<a href=3D"http://github.com/fsnotify/$%7BSRCNAME%=
7D" rel=3D"noreferrer" target=3D"_blank">github.com/fsnotify/${SRCNAME}</a>=
&quot;<br>
-SRC_URI =3D &quot;git://${PKG_NAME}.git;branch=3Dmaster&quot;<br>
+SRC_URI =3D &quot;git://${PKG_NAME}.git;branch=3Dmaster;protocol=3Dhttps&q=
uot;<br>
<br>
=C2=A0SRCREV =3D &quot;836bfd95fecc0f1511dd66bdbf2b5b61ab8b00b6&quot;<br>
=C2=A0PV =3D &quot;1.2.11+git${SRCPV}&quot;<br>
diff --git a/recipes-devtools/go/<a href=3D"http://go-libtrust_git.bb" rel=
=3D"noreferrer" target=3D"_blank">go-libtrust_git.bb</a> b/recipes-devtools=
/go/<a href=3D"http://go-libtrust_git.bb" rel=3D"noreferrer" target=3D"_bla=
nk">go-libtrust_git.bb</a><br>
index 404baf5..e2a28ec 100644<br>
--- a/recipes-devtools/go/<a href=3D"http://go-libtrust_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">go-libtrust_git.bb</a><br>
+++ b/recipes-devtools/go/<a href=3D"http://go-libtrust_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">go-libtrust_git.bb</a><br>
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D435b266b389=
9aa8a959f17d41c56def8&quot;<br>
=C2=A0SRCNAME =3D &quot;libtrust&quot;<br>
<br>
=C2=A0PKG_NAME =3D &quot;<a href=3D"http://github.com/docker/$%7BSRCNAME%7D=
" rel=3D"noreferrer" target=3D"_blank">github.com/docker/${SRCNAME}</a>&quo=
t;<br>
-SRC_URI =3D &quot;git://${PKG_NAME}.git;branch=3Dmaster&quot;<br>
+SRC_URI =3D &quot;git://${PKG_NAME}.git;branch=3Dmaster;protocol=3Dhttps&q=
uot;<br>
<br>
=C2=A0SRCREV =3D &quot;9cbd2a1374f46905c68a4eb3694a130610adc62a&quot;<br>
=C2=A0PV =3D &quot;0.0+git${SRCPV}&quot;<br>
diff --git a/recipes-devtools/go/<a href=3D"http://go-logrus_git.bb" rel=3D=
"noreferrer" target=3D"_blank">go-logrus_git.bb</a> b/recipes-devtools/go/<=
a href=3D"http://go-logrus_git.bb" rel=3D"noreferrer" target=3D"_blank">go-=
logrus_git.bb</a><br>
index b54b32b..2c59d34 100644<br>
--- a/recipes-devtools/go/<a href=3D"http://go-logrus_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">go-logrus_git.bb</a><br>
+++ b/recipes-devtools/go/<a href=3D"http://go-logrus_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">go-logrus_git.bb</a><br>
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D8dadfef729c=
08ec4e631c4f6fc5d43a0&quot;<br>
=C2=A0SRCNAME =3D &quot;logrus&quot;<br>
<br>
=C2=A0PKG_NAME =3D &quot;<a href=3D"http://github.com/Sirupsen/$%7BSRCNAME%=
7D" rel=3D"noreferrer" target=3D"_blank">github.com/Sirupsen/${SRCNAME}</a>=
&quot;<br>
-SRC_URI =3D &quot;git://${PKG_NAME}.git;branch=3Dmaster&quot;<br>
+SRC_URI =3D &quot;git://${PKG_NAME}.git;branch=3Dmaster;protocol=3Dhttps&q=
uot;<br>
<br>
=C2=A0SRCREV =3D &quot;d26492970760ca5d33129d2d799e34be5c4782eb&quot;<br>
=C2=A0PV =3D &quot;0.11.0+git${SRCPV}&quot;<br>
diff --git a/recipes-devtools/go/<a href=3D"http://go-metalinter_git.bb" re=
l=3D"noreferrer" target=3D"_blank">go-metalinter_git.bb</a> b/recipes-devto=
ols/go/<a href=3D"http://go-metalinter_git.bb" rel=3D"noreferrer" target=3D=
"_blank">go-metalinter_git.bb</a><br>
index 3bef3b5..3dda45c 100644<br>
--- a/recipes-devtools/go/<a href=3D"http://go-metalinter_git.bb" rel=3D"no=
referrer" target=3D"_blank">go-metalinter_git.bb</a><br>
+++ b/recipes-devtools/go/<a href=3D"http://go-metalinter_git.bb" rel=3D"no=
referrer" target=3D"_blank">go-metalinter_git.bb</a><br>
@@ -9,7 +9,7 @@ BBCLASSEXTEND =3D &quot;native&quot;<br>
=C2=A0SRCNAME =3D &quot;gometalinter&quot;<br>
<br>
=C2=A0PKG_NAME =3D &quot;<a href=3D"http://github.com/alecthomas/$%7BSRCNAM=
E%7D" rel=3D"noreferrer" target=3D"_blank">github.com/alecthomas/${SRCNAME}=
</a>&quot;<br>
-SRC_URI =3D &quot;git://${PKG_NAME}.git;branch=3Dmaster&quot;<br>
+SRC_URI =3D &quot;git://${PKG_NAME}.git;branch=3Dmaster;protocol=3Dhttps&q=
uot;<br>
<br>
=C2=A0SRCREV =3D &quot;e8d801238da6f0dfd14078d68f9b53fa50a7eeb5&quot;<br>
=C2=A0PV =3D &quot;0.0+git${SRCPV}&quot;<br>
diff --git a/recipes-devtools/go/<a href=3D"http://go-mux_git.bb" rel=3D"no=
referrer" target=3D"_blank">go-mux_git.bb</a> b/recipes-devtools/go/<a href=
=3D"http://go-mux_git.bb" rel=3D"noreferrer" target=3D"_blank">go-mux_git.b=
b</a><br>
index c0db050..3f939f4 100644<br>
--- a/recipes-devtools/go/<a href=3D"http://go-mux_git.bb" rel=3D"noreferre=
r" target=3D"_blank">go-mux_git.bb</a><br>
+++ b/recipes-devtools/go/<a href=3D"http://go-mux_git.bb" rel=3D"noreferre=
r" target=3D"_blank">go-mux_git.bb</a><br>
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dc50f6bd9c1e=
15ed0bad3bea18e3c1b7f&quot;<br>
=C2=A0SRCNAME =3D &quot;mux&quot;<br>
<br>
=C2=A0PKG_NAME =3D &quot;<a href=3D"http://github.com/gorilla/$%7BSRCNAME%7=
D" rel=3D"noreferrer" target=3D"_blank">github.com/gorilla/${SRCNAME}</a>&q=
uot;<br>
-SRC_URI =3D &quot;git://${PKG_NAME}.git;branch=3Dmaster&quot;<br>
+SRC_URI =3D &quot;git://${PKG_NAME}.git;branch=3Dmaster;protocol=3Dhttps&q=
uot;<br>
<br>
=C2=A0SRCREV =3D &quot;136d54f81f00414c45c3c68dd47e98cc97519c5e&quot;<br>
<br>
diff --git a/recipes-devtools/go/<a href=3D"http://go-patricia_git.bb" rel=
=3D"noreferrer" target=3D"_blank">go-patricia_git.bb</a> b/recipes-devtools=
/go/<a href=3D"http://go-patricia_git.bb" rel=3D"noreferrer" target=3D"_bla=
nk">go-patricia_git.bb</a><br>
index 1098560..4c29b57 100644<br>
--- a/recipes-devtools/go/<a href=3D"http://go-patricia_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">go-patricia_git.bb</a><br>
+++ b/recipes-devtools/go/<a href=3D"http://go-patricia_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">go-patricia_git.bb</a><br>
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D9949b99212e=
dd6b1e24ce702376c3baf&quot;<br>
=C2=A0SRCNAME =3D &quot;go-patricia&quot;<br>
<br>
=C2=A0PKG_NAME =3D &quot;<a href=3D"http://github.com/tchap/$%7BSRCNAME%7D"=
 rel=3D"noreferrer" target=3D"_blank">github.com/tchap/${SRCNAME}</a>&quot;=
<br>
-SRC_URI =3D &quot;git://${PKG_NAME}.git;branch=3Dmaster&quot;<br>
+SRC_URI =3D &quot;git://${PKG_NAME}.git;branch=3Dmaster;protocol=3Dhttps&q=
uot;<br>
<br>
=C2=A0SRCREV =3D &quot;666120de432aea38ab06bd5c818f04f4129882c9&quot;<br>
=C2=A0PV =3D &quot;2.2.6+git${SRCPV}&quot;<br>
diff --git a/recipes-devtools/go/<a href=3D"http://go-pty_git.bb" rel=3D"no=
referrer" target=3D"_blank">go-pty_git.bb</a> b/recipes-devtools/go/<a href=
=3D"http://go-pty_git.bb" rel=3D"noreferrer" target=3D"_blank">go-pty_git.b=
b</a><br>
index 0baa70d..132e82d 100644<br>
--- a/recipes-devtools/go/<a href=3D"http://go-pty_git.bb" rel=3D"noreferre=
r" target=3D"_blank">go-pty_git.bb</a><br>
+++ b/recipes-devtools/go/<a href=3D"http://go-pty_git.bb" rel=3D"noreferre=
r" target=3D"_blank">go-pty_git.bb</a><br>
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://License;md5=3D93958070863=
d769117fa33b129020050&quot;<br>
=C2=A0SRCNAME =3D &quot;pty&quot;<br>
<br>
=C2=A0PKG_NAME =3D &quot;<a href=3D"http://github.com/creack/$%7BSRCNAME%7D=
" rel=3D"noreferrer" target=3D"_blank">github.com/creack/${SRCNAME}</a>&quo=
t;<br>
-SRC_URI =3D &quot;git://${PKG_NAME}.git;branch=3Dmaster&quot;<br>
+SRC_URI =3D &quot;git://${PKG_NAME}.git;branch=3Dmaster;protocol=3Dhttps&q=
uot;<br>
<br>
=C2=A0SRCREV =3D &quot;05017fcccf23c823bfdea560dcc958a136e54fb7&quot;<br>
<br>
diff --git a/recipes-devtools/go/<a href=3D"http://notary_git.bb" rel=3D"no=
referrer" target=3D"_blank">notary_git.bb</a> b/recipes-devtools/go/<a href=
=3D"http://notary_git.bb" rel=3D"noreferrer" target=3D"_blank">notary_git.b=
b</a><br>
index 3e908a0..972da5e 100644<br>
--- a/recipes-devtools/go/<a href=3D"http://notary_git.bb" rel=3D"noreferre=
r" target=3D"_blank">notary_git.bb</a><br>
+++ b/recipes-devtools/go/<a href=3D"http://notary_git.bb" rel=3D"noreferre=
r" target=3D"_blank">notary_git.bb</a><br>
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://src/${PKG_NAME}/LICENSE;m=
d5=3D3596b980bb036e0875174ed15<br>
=C2=A0SRCNAME =3D &quot;notary&quot;<br>
<br>
=C2=A0PKG_NAME =3D &quot;<a href=3D"http://github.com/docker/$%7BSRCNAME%7D=
" rel=3D"noreferrer" target=3D"_blank">github.com/docker/${SRCNAME}</a>&quo=
t;<br>
-SRC_URI =3D &quot;git://${PKG_NAME}.git;destsuffix=3Dgit/src/${PKG_NAME};b=
ranch=3Dmaster&quot;<br>
+SRC_URI =3D &quot;git://${PKG_NAME}.git;destsuffix=3Dgit/src/${PKG_NAME};b=
ranch=3Dmaster;protocol=3Dhttps&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;d6e1431feb32348e0650bf7551ac5cffd01d857b&quot;<br>
=C2=A0PV =3D &quot;0.6.1+git${SRCPV}&quot;<br>
-- <br>
2.32.0<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000d6382105cfe2e867--
