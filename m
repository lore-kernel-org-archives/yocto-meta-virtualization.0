Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9B0E5E007D2; Wed, 27 Jun 2018 12:57:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.44 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 21C0CE007D2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Jun 2018 12:57:19 -0700 (PDT)
Received: by mail-lf0-f44.google.com with SMTP id i15-v6so2450463lfc.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Jun 2018 12:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gqS3rFvRCRTlTZBpi126f1YOb8HYfzbbxfjMD3ACDuE=;
	b=efiTCFevJ0Cgqdolzwqcq5YvlIOrC24ZFxsiKveiA+IScNBE6P/cc8FpoJnaN6+nKh
	4VIvgKJYoQJJYd8QweodLPzm0ycWYgl4N9eaihyieebe2QwRDyzX/tit3sMIMQ66Tomf
	E+lfBGAlWEe0w8GCi5+K/ks3R2mA9ab2GRgKfP8YqGj/4NFwBtAZWAEkJBz/NEMBWLmG
	X1NFEZmDUzzij0iVRDbtFDIZb38WXu7iPhJkfn4VAQS3OOtX91404GdGfDDBHozRSKiP
	m4DUDKOyXwjQsd7hxjDlbwUxBYXy+58D8bM9bFFdoxxbWWKsO0WwX8+zY2TVaoYTg6kq
	562Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gqS3rFvRCRTlTZBpi126f1YOb8HYfzbbxfjMD3ACDuE=;
	b=LZI34ZHzTHK0vVBAmb4n3QmNXNgF6hKMjzD5sP2bKP/VIFROlUsUAVdizDB1XwgQWr
	/YGEGKJKBZOdSX0t0HUxzNOBAru5a6m4Q1i75OQPXHxrZnGNtHsKa79RwQCJlOj+b/8a
	J3ogTl8gxxdU2OFd4R9Bx6731qjlKa5lQ5purMZse2F3OvjMmPNsGRYhyu1oOs2IDvEz
	skt7txyZE7m6gZxIMimRlCFeAn4kB3zga3iL3aYzxlPVBU5Q9PUAg/kENqq5pyT3UP34
	DrUHRWf7Uh9ODCdfxs0S5Kzqpfp7vepP04Qva/e1z8aJQ2xIdORhRNpCvE+9p89VxLrR
	2/Zg==
X-Gm-Message-State: APt69E3MJrC5Udy+IfB9WguYDzhslHQvh7cfH174qM/3YGJVwPx6yyNW
	LSbNNZQqKcyBo54nWGZB8Uz5bXFFYOraPfWLVgpdbQ==
X-Google-Smtp-Source: AAOMgpd53HcweeDwBKzKoc+YSpNQ/64hH/PO9W2M1V4AuqdexjuqNrzzAUUN2PhE8v7swKRhnwskrf1SZc1i92APlSw=
X-Received: by 2002:a19:e119:: with SMTP id y25-v6mr4827209lfg.3.1530129437743;
	Wed, 27 Jun 2018 12:57:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP; Wed, 27 Jun 2018 12:57:17
	-0700 (PDT)
In-Reply-To: <alpine.LFD.2.21.1806220744150.31293@localhost.localdomain>
References: <alpine.LFD.2.21.1806220744150.31293@localhost.localdomain>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 27 Jun 2018 15:57:17 -0400
Message-ID: <CADkTA4Moz=GeQeEU0-W5r3+Syzhg118D6uguCZmwD9ETosaPOQ@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: build error, iasl-native, fully-updated fedora 28
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jun 2018 19:57:22 -0000
Content-Type: multipart/alternative; boundary="00000000000098e0fd056fa505f9"

--00000000000098e0fd056fa505f9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

How did it go with this ?

Looks like a gcc 8.x introduced build issue. Most likely an update to the
package is required.

Bruce

On Fri, Jun 22, 2018 at 7:48 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
>   building with wind river's pulsar linux, target x86_64, and
> iasl-native build fails as below. this is with gcc-8.1.1, and this
> appears to be a generic enough issue that i thought i would ask about
> it here rather than at the pulsar linux github page.
>
>   thoughts?
>
> WARNING: Layer skeleton should set LAYERSERIES_COMPAT_skeleton in its
> conf/layer.conf file to list the core layer names it is compatible with.
> WARNING: Layer external-binaries should set LAYERSERIES_COMPAT_external-b=
inaries
> in its conf/layer.conf file to list the core layer names it is compatible
> with.
> WARNING: Layer refkit-extra should set LAYERSERIES_COMPAT_refkit-extra in
> its conf/layer.conf file to list the core layer names it is compatible wi=
th.
> WARNING: Layer iot-cloud should set LAYERSERIES_COMPAT_iot-cloud in its
> conf/layer.conf file to list the core layer names it is compatible with.
> WARNING: Layer metagw should set LAYERSERIES_COMPAT_metagw in its
> conf/layer.conf file to list the core layer names it is compatible with.
> WARNING: Layer up-board should set LAYERSERIES_COMPAT_up-board in its
> conf/layer.conf file to list the core layer names it is compatible with.
> WARNING: Layer wrlabs-integration should set LAYERSERIES_COMPAT_wrlabs-in=
tegration
> in its conf/layer.conf file to list the core layer names it is compatible
> with.
> NOTE: Started PRServer with DBfile: /home/rpjday/github/pulsar/wr-
> core/build-intel-x86/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 35135,
> PID: 30586
> WARNING: Layer skeleton should set LAYERSERIES_COMPAT_skeleton in its
> conf/layer.conf file to list the core layer names it is compatible with.
> WARNING: Layer external-binaries should set LAYERSERIES_COMPAT_external-b=
inaries
> in its conf/layer.conf file to list the core layer names it is compatible
> with.
> WARNING: Layer refkit-extra should set LAYERSERIES_COMPAT_refkit-extra in
> its conf/layer.conf file to list the core layer names it is compatible wi=
th.
> WARNING: Layer iot-cloud should set LAYERSERIES_COMPAT_iot-cloud in its
> conf/layer.conf file to list the core layer names it is compatible with.
> WARNING: Layer metagw should set LAYERSERIES_COMPAT_metagw in its
> conf/layer.conf file to list the core layer names it is compatible with.
> WARNING: Layer up-board should set LAYERSERIES_COMPAT_up-board in its
> conf/layer.conf file to list the core layer names it is compatible with.
> WARNING: Layer wrlabs-integration should set LAYERSERIES_COMPAT_wrlabs-in=
tegration
> in its conf/layer.conf file to list the core layer names it is compatible
> with.
> Loading cache...done.
> Loaded 4912 entries from dependency cache.
> Parsing recipes...done.
> Parsing of 3683 .bb files complete (3679 cached, 4 parsed). 4916 targets,
> 89 skipped, 5 masked, 0 errors.
> WARNING: No recipes available for:
>   /home/rpjday/github/pulsar/wr-core/layers/meta-cloud-
> services/meta-openstack/recipes-extended/libvirt/libvirt_1.%.bbappend
>   /home/rpjday/github/pulsar/wr-core/layers/meta-cloud-
> services/meta-openstack/recipes-kernel/linux/linux-yocto_4.10.bbappend
>   /home/rpjday/github/pulsar/wr-core/layers/meta-cloud-
> services/meta-openstack/recipes-kernel/linux/linux-yocto_4.4.bbappend
>   /home/rpjday/github/pulsar/wr-core/layers/meta-cloud-
> services/meta-openstack/recipes-kernel/linux/linux-yocto_4.9.bbappend
>   /home/rpjday/github/pulsar/wr-core/layers/meta-gateway/
> recipes-core-luci/busybox/busybox_1.22.1.bbappend
>   /home/rpjday/github/pulsar/wr-core/layers/meta-gateway/
> recipes-kernel/kernel/linux-yocto-rt_4.9.bbappend
>   /home/rpjday/github/pulsar/wr-core/layers/meta-gateway/
> recipes-kernel/kernel/linux-yocto_4.9.bbappend
>   /home/rpjday/github/pulsar/wr-core/layers/meta-gateway/
> recipes-navigation/gpsd/gpsd_3.16.bbappend
>   /home/rpjday/github/pulsar/wr-core/layers/wrlabs-
> integration/recipes-bsp/shim/shim_git.bbappend
>   /home/rpjday/github/pulsar/wr-core/layers/wrlabs-integration/recipes-
> containers/lxc/lxc_2.0.%.bbappend
>   /home/rpjday/github/pulsar/wr-core/layers/wrlabs-
> integration/recipes-core/dbus/dbus_1.10.20.bbappend
>   /home/rpjday/github/pulsar/wr-core/layers/wrlabs-
> integration/recipes-core/util-linux/util-linux_2.30.bbappend
>   /home/rpjday/github/pulsar/wr-core/layers/wrlabs-
> integration/recipes-extended/libsolv/libsolv_0.6.28.bbappend
>   /home/rpjday/github/pulsar/wr-core/layers/wrlabs-
> integration/recipes-extended/libvirt/libvirt_1.3.5.bbappend
>   /home/rpjday/github/pulsar/wr-core/layers/wrlabs-
> integration/recipes-extended/man-pages/man-pages_4.11.bbappend
>   /home/rpjday/github/pulsar/wr-core/layers/wrlabs-
> integration/recipes-hac/haccmds/haccmds_1.0.bbappend
>   /home/rpjday/github/pulsar/wr-core/layers/wrlabs-
> integration/recipes-kernel/linux/linux-yocto-rt_4.9.bbappend
>   /home/rpjday/github/pulsar/wr-core/layers/wrlabs-
> integration/recipes-kernel/linux/linux-yocto_4.9.bbappend
> NOTE: Multiple providers are available for iasl-native (iasl-native,
> acpica-native)
> Consider defining a PREFERRED_PROVIDER entry to match iasl-native
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           =3D "1.39.0"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "fedora-28"
> TARGET_SYS           =3D "x86_64-wrs-linux"
> MACHINE              =3D "intel-corei7-64"
> DISTRO               =3D "Pulsar-Linux"
> DISTRO_VERSION       =3D "10.17.41.1"
> TUNE_FEATURES        =3D "m64 core2"
> TARGET_FPU           =3D ""
> meta                 =3D "HEAD:b34e86b4ee13d53f09d558e613d5b66c845edde6"
> oe-meta-go           =3D "HEAD:b29b384eae4a40933d07cc64c51e890c289d9621"
> meta-virtualization  =3D "HEAD:8344dd9e9f55a5ea81f9c57c74bd9a8b9a04e8ad"
> external-binaries    =3D "HEAD:78d4168b29efe5e812c36502a1c300d3d4c45935"
> meta-xfce
> meta-webserver
> meta-perl
> meta-python
> meta-oe
> meta-gnome
> meta-multimedia
> meta-networking
> meta-filesystems
> meta-initramfs       =3D "HEAD:a4056a96ecc857b1d675b89dc35cf9ed8a876f80"
> meta-refkit-extra    =3D "HEAD:4ca2e7474b046fa0bd7813cd6da7cf455733d61c"
> meta-dpdk            =3D "HEAD:8a0f847836671111915088d2838e3ff6f3c7642c"
> meta-java            =3D "HEAD:aa276b00d8a6bbffffd59d1980153c99521ce6ea"
> meta-iot-cloud       =3D "HEAD:6039a7a8a9a0cad4e32736be3a05a529b65e126a"
> meta-security        =3D "HEAD:f9c5e2022b54097474e46d9efb54080bd0e4d606"
> meta-browser         =3D "HEAD:1cd38d701a49eade80a04140f70d3383117b9745"
> meta-openstack
> meta-cloud-services  =3D "HEAD:31e3086409b5055b8ce5962a614f1284003c513d"
> meta-cube            =3D "HEAD:62f03f7d42f784923a8b02ce9d30d62d6552a22b"
> meta-gateway         =3D "HEAD:48dae0603506cff9bde674755d963e5cf3e75244"
> meta-up-board        =3D "HEAD:024d0f5e404cb29789c2bba90aa72efd00f2a0e6"
> meta-intel           =3D "HEAD:fec5d45ec3978d4b7c9649bee45fe58f914bcee4"
> wrlabs-integration   =3D "HEAD:02e0f675db192294044ffbce6146ec25f34ffdba"
>
> Initialising tasks...done.
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> NOTE: Running task 94 of 98 (virtual:native:/home/rpjday/
> github/pulsar/wr-core/layers/meta-virtualization/recipes-
> extended/iasl/iasl_20160527.bb:do_compile)
> NOTE: recipe iasl-native-20160527-r0: task do_compile: Started
> ERROR: iasl-native-20160527-r0 do_compile: oe_runmake failed
> ERROR: iasl-native-20160527-r0 do_compile: Function failed: do_compile
> (log file is located at /home/rpjday/github/pulsar/wr-
> core/build-intel-x86/tmp/work/x86_64-linux/iasl-native/
> 20160527-r0/temp/log.do_compile.30670)
> ERROR: Logfile of failure stored in: /home/rpjday/github/pulsar/wr-
> core/build-intel-x86/tmp/work/x86_64-linux/iasl-native/
> 20160527-r0/temp/log.do_compile.30670
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j 8 iasl NOOPT=3DTRUE NOFORTIFY=3DTRUE
> | make[1]: Entering directory '/home/rpjday/github/pulsar/
> wr-core/build-intel-x86/tmp/work/x86_64-linux/iasl-native/
> 20160527-r0/acpica-unix-20160527/generate/unix/iasl'
> | gcc  -c -isystem/home/rpjday/github/pulsar/wr-core/build-intel-
> x86/tmp/work/x86_64-linux/iasl-native/20160527-r0/
> recipe-sysroot-native/usr/include -O2 -pipe -D_CYGWIN -D_GNU_SOURCE
> -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/inclu=
de
> -DACPI_ASL_COMPILER -I../../../source/compiler -Iobj -std=3Dc99 -Wall
> -Wbad-function-cast -Wdeclaration-after-statement -Werror -Wformat=3D2
> -Wmissing-declarations -Wmissing-prototypes -Wstrict-aliasing=3D0
> -Wstrict-prototypes -Wswitch-default -Wpointer-arith -Wundef -Waddress
> -Waggregate-return -Winit-self -Winline -Wmissing-declarations
> -Wmissing-field-initializers -Wnested-externs -Wold-style-definition
> -Wno-format-nonliteral -Wredundant-decls -Wempty-body -Woverride-init
> -Wlogical-op -Wmissing-parameter-type -Wold-style-declaration -Wtype-limi=
ts
> -o obj/aslanalyze.o ../../../source/compiler/aslanalyze.c
> | gcc  -c -isystem/home/rpjday/github/pulsar/wr-core/build-intel-
> x86/tmp/work/x86_64-linux/iasl-native/20160527-r0/
> recipe-sysroot-native/usr/include -O2 -pipe -D_CYGWIN -D_GNU_SOURCE
> -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/inclu=
de
> -DACPI_ASL_COMPILER -I../../../source/compiler -Iobj -std=3Dc99 -Wall
> -Wbad-function-cast -Wdeclaration-after-statement -Werror -Wformat=3D2
> -Wmissing-declarations -Wmissing-prototypes -Wstrict-aliasing=3D0
> -Wstrict-prototypes -Wswitch-default -Wpointer-arith -Wundef -Waddress
> -Waggregate-return -Winit-self -Winline -Wmissing-declarations
> -Wmissing-field-initializers -Wnested-externs -Wold-style-definition
> -Wno-format-nonliteral -Wredundant-decls -Wempty-body -Woverride-init
> -Wlogical-op -Wmissing-parameter-type -Wold-style-declaration -Wtype-limi=
ts
> -o obj/aslcodegen.o ../../../source/compiler/aslcodegen.c
> | gcc  -c -isystem/home/rpjday/github/pulsar/wr-core/build-intel-
> x86/tmp/work/x86_64-linux/iasl-native/20160527-r0/
> recipe-sysroot-native/usr/include -O2 -pipe -D_CYGWIN -D_GNU_SOURCE
> -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/inclu=
de
> -DACPI_ASL_COMPILER -I../../../source/compiler -Iobj -std=3Dc99 -Wall
> -Wbad-function-cast -Wdeclaration-after-statement -Werror -Wformat=3D2
> -Wmissing-declarations -Wmissing-prototypes -Wstrict-aliasing=3D0
> -Wstrict-prototypes -Wswitch-default -Wpointer-arith -Wundef -Waddress
> -Waggregate-return -Winit-self -Winline -Wmissing-declarations
> -Wmissing-field-initializers -Wnested-externs -Wold-style-definition
> -Wno-format-nonliteral -Wredundant-decls -Wempty-body -Woverride-init
> -Wlogical-op -Wmissing-parameter-type -Wold-style-declaration -Wtype-limi=
ts
> -o obj/aslpredef.o ../../../source/compiler/aslpredef.c
> | gcc  -c -isystem/home/rpjday/github/pulsar/wr-core/build-intel-
> x86/tmp/work/x86_64-linux/iasl-native/20160527-r0/
> recipe-sysroot-native/usr/include -O2 -pipe -D_CYGWIN -D_GNU_SOURCE
> -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/inclu=
de
> -DACPI_ASL_COMPILER -I../../../source/compiler -Iobj -std=3Dc99 -Wall
> -Wbad-function-cast -Wdeclaration-after-statement -Werror -Wformat=3D2
> -Wmissing-declarations -Wmissing-prototypes -Wstrict-aliasing=3D0
> -Wstrict-prototypes -Wswitch-default -Wpointer-arith -Wundef -Waddress
> -Waggregate-return -Winit-self -Winline -Wmissing-declarations
> -Wmissing-field-initializers -Wnested-externs -Wold-style-definition
> -Wno-format-nonliteral -Wredundant-decls -Wempty-body -Woverride-init
> -Wlogical-op -Wmissing-parameter-type -Wold-style-declaration -Wtype-limi=
ts
> -o obj/aslprepkg.o ../../../source/compiler/aslprepkg.c
> | gcc  -c -isystem/home/rpjday/github/pulsar/wr-core/build-intel-
> x86/tmp/work/x86_64-linux/iasl-native/20160527-r0/
> recipe-sysroot-native/usr/include -O2 -pipe -D_CYGWIN -D_GNU_SOURCE
> -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/inclu=
de
> -DACPI_ASL_COMPILER -I../../../source/compiler -Iobj -std=3Dc99 -Wall
> -Wbad-function-cast -Wdeclaration-after-statement -Werror -Wformat=3D2
> -Wmissing-declarations -Wmissing-prototypes -Wstrict-aliasing=3D0
> -Wstrict-prototypes -Wswitch-default -Wpointer-arith -Wundef -Waddress
> -Waggregate-return -Winit-self -Winline -Wmissing-declarations
> -Wmissing-field-initializers -Wnested-externs -Wold-style-definition
> -Wno-format-nonliteral -Wredundant-decls -Wempty-body -Woverride-init
> -Wlogical-op -Wmissing-parameter-type -Wold-style-declaration -Wtype-limi=
ts
> -o obj/aslprintf.o ../../../source/compiler/aslprintf.c
> | gcc  -c -isystem/home/rpjday/github/pulsar/wr-core/build-intel-
> x86/tmp/work/x86_64-linux/iasl-native/20160527-r0/
> recipe-sysroot-native/usr/include -O2 -pipe -D_CYGWIN -D_GNU_SOURCE
> -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/inclu=
de
> -DACPI_ASL_COMPILER -I../../../source/compiler -Iobj -std=3Dc99 -Wall
> -Wbad-function-cast -Wdeclaration-after-statement -Werror -Wformat=3D2
> -Wmissing-declarations -Wmissing-prototypes -Wstrict-aliasing=3D0
> -Wstrict-prototypes -Wswitch-default -Wpointer-arith -Wundef -Waddress
> -Waggregate-return -Winit-self -Winline -Wmissing-declarations
> -Wmissing-field-initializers -Wnested-externs -Wold-style-definition
> -Wno-format-nonliteral -Wredundant-decls -Wempty-body -Woverride-init
> -Wlogical-op -Wmissing-parameter-type -Wold-style-declaration -Wtype-limi=
ts
> -o obj/aslprune.o ../../../source/compiler/aslprune.c
> | gcc  -c -isystem/home/rpjday/github/pulsar/wr-core/build-intel-
> x86/tmp/work/x86_64-linux/iasl-native/20160527-r0/
> recipe-sysroot-native/usr/include -O2 -pipe -D_CYGWIN -D_GNU_SOURCE
> -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/inclu=
de
> -DACPI_ASL_COMPILER -I../../../source/compiler -Iobj -std=3Dc99 -Wall
> -Wbad-function-cast -Wdeclaration-after-statement -Werror -Wformat=3D2
> -Wmissing-declarations -Wmissing-prototypes -Wstrict-aliasing=3D0
> -Wstrict-prototypes -Wswitch-default -Wpointer-arith -Wundef -Waddress
> -Waggregate-return -Winit-self -Winline -Wmissing-declarations
> -Wmissing-field-initializers -Wnested-externs -Wold-style-definition
> -Wno-format-nonliteral -Wredundant-decls -Wempty-body -Woverride-init
> -Wlogical-op -Wmissing-parameter-type -Wold-style-declaration -Wtype-limi=
ts
> -o obj/aslresource.o ../../../source/compiler/aslresource.c
> | gcc  -c -isystem/home/rpjday/github/pulsar/wr-core/build-intel-
> x86/tmp/work/x86_64-linux/iasl-native/20160527-r0/
> recipe-sysroot-native/usr/include -O2 -pipe -D_CYGWIN -D_GNU_SOURCE
> -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/inclu=
de
> -DACPI_ASL_COMPILER -I../../../source/compiler -Iobj -std=3Dc99 -Wall
> -Wbad-function-cast -Wdeclaration-after-statement -Werror -Wformat=3D2
> -Wmissing-declarations -Wmissing-prototypes -Wstrict-aliasing=3D0
> -Wstrict-prototypes -Wswitch-default -Wpointer-arith -Wundef -Waddress
> -Waggregate-return -Winit-self -Winline -Wmissing-declarations
> -Wmissing-field-initializers -Wnested-externs -Wold-style-definition
> -Wno-format-nonliteral -Wredundant-decls -Wempty-body -Woverride-init
> -Wlogical-op -Wmissing-parameter-type -Wold-style-declaration -Wtype-limi=
ts
> -o obj/aslrestype1.o ../../../source/compiler/aslrestype1.c
> | In function =E2=80=98CgWriteTableHeader=E2=80=99,
> |     inlined from =E2=80=98CgWriteNode=E2=80=99 at ../../../source/compi=
ler/
> aslcodegen.c:715:9,
> |     inlined from =E2=80=98CgAmlWriteWalk=E2=80=99 at ../../../source/co=
mpiler/
> aslcodegen.c:207:5:
> | ../../../source/compiler/aslcodegen.c:500:5: error: =E2=80=98strncpy=E2=
=80=99 specified
> bound 4 equals destination size [-Werror=3Dstringop-truncation]
> |      strncpy (TableHeader.Signature, Child->Asl.Value.String, 4);
> |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> | ../../../source/compiler/aslcodegen.c:517:5: error: =E2=80=98strncpy=E2=
=80=99 specified
> bound 6 equals destination size [-Werror=3Dstringop-truncation]
> |      strncpy (TableHeader.OemId, Child->Asl.Value.String, 6);
> |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> | ../../../source/compiler/aslcodegen.c:522:5: error: =E2=80=98strncpy=E2=
=80=99 specified
> bound 8 equals destination size [-Werror=3Dstringop-truncation]
> |      strncpy (TableHeader.OemTableId, Child->Asl.Value.String, 8);
> |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> | ../../../source/compiler/aslpredef.c: In function
> =E2=80=98ApCheckForPredefinedMethod=E2=80=99:
> | ../../../source/compiler/aslpredef.c:237:33: error: =E2=80=98 required =
for =E2=80=99
> directive writing 14 bytes into a region of size between 1 and 4096
> [-Werror=3Dformat-overflow=3D]
> |              sprintf (MsgBuffer, "%s required for %4.4s",
> |                                  ^~~~~~~~~~~~~~~~~~~~~~~
> | ../../../source/compiler/aslpredef.c:237:13: note: =E2=80=98sprintf=E2=
=80=99 output
> between 19 and 4114 bytes into a destination of size 4096
> |              sprintf (MsgBuffer, "%s required for %4.4s",
> |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> |                  StringBuffer, ThisName->Info.Name);
> |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> | ../../../source/compiler/aslanalyze.c: In function
> =E2=80=98AnCheckMethodReturnValue=E2=80=99:
> | ../../../source/compiler/aslanalyze.c:431:17: error: =E2=80=98%s=E2=80=
=99 directive
> writing up to 4095 bytes into a region of size 4080
> [-Werror=3Dformat-overflow=3D]
> |                  "Method returns [%s], %s operator requires [%s]",
> |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> |                  StringBuffer, OpInfo->Name, StringBuffer2);
> |                  ~~~~~~~~~~~~
> | ../../../source/compiler/aslanalyze.c:430:13: note: =E2=80=98sprintf=E2=
=80=99 output 41
> or more bytes (assuming 8231) into a destination of size 4096
> |              sprintf (MsgBuffer,
> |              ^~~~~~~~~~~~~~~~~~~
> |                  "Method returns [%s], %s operator requires [%s]",
> |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> |                  StringBuffer, OpInfo->Name, StringBuffer2);
> |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> | ../../../source/compiler/aslpredef.c: In function =E2=80=98ApCheckObjec=
tType=E2=80=99:
> | ../../../source/compiler/aslpredef.c:780:29: error: =E2=80=98%s=E2=80=
=99 directive
> writing up to 4095 bytes into a region of size between 4056 and 4071
> [-Werror=3Dformat-overflow=3D]
> |          sprintf (MsgBuffer, "%4.4s: found %s at index %u, %s required"=
,
> |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> |              PredefinedName, TypeName, PackageIndex, StringBuffer);
> |                                                      ~~~~~~~~~~~~
> | ../../../source/compiler/aslpredef.c:780:9: note: =E2=80=98sprintf=E2=
=80=99 output 35
> or more bytes (assuming 4145) into a destination of size 4096
> |          sprintf (MsgBuffer, "%4.4s: found %s at index %u, %s required"=
,
> |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~
> |              PredefinedName, TypeName, PackageIndex, StringBuffer);
> |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> | ../../../source/compiler/aslpredef.c:775:29: error: =E2=80=98%s=E2=80=
=99 directive
> writing up to 4095 bytes into a region of size between 4076 and 4082
> [-Werror=3Dformat-overflow=3D]
> |          sprintf (MsgBuffer, "%4.4s: found %s, %s required",
> |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> |              PredefinedName, TypeName, StringBuffer);
> |                                        ~~~~~~~~~~~~
> | ../../../source/compiler/aslpredef.c:775:9: note: =E2=80=98sprintf=E2=
=80=99 output 24
> or more bytes (assuming 4125) into a destination of size 4096
> |          sprintf (MsgBuffer, "%4.4s: found %s, %s required",
> |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> |              PredefinedName, TypeName, StringBuffer);
> |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> | cc1: all warnings being treated as errors
> | make[1]: *** [../Makefile.rules:18: obj/aslcodegen.o] Error 1
> | make[1]: *** Waiting for unfinished jobs....
> | cc1: all warnings being treated as errors
> | make[1]: *** [../Makefile.rules:18: obj/aslanalyze.o] Error 1
> | cc1: all warnings being treated as errors
> | make[1]: *** [../Makefile.rules:18: obj/aslpredef.o] Error 1
> | make[1]: Leaving directory '/home/rpjday/github/pulsar/
> wr-core/build-intel-x86/tmp/work/x86_64-linux/iasl-native/
> 20160527-r0/acpica-unix-20160527/generate/unix/iasl'
> | make: *** [generate/unix/Makefile.common:25: iasl] Error 2
> | ERROR: oe_runmake failed
> | WARNING: /home/rpjday/github/pulsar/wr-core/build-intel-x86/tmp/work/
> x86_64-linux/iasl-native/20160527-r0/temp/run.do_compile.30670:1 exit 1
> from 'exit 1'
> | ERROR: Function failed: do_compile (log file is located at
> /home/rpjday/github/pulsar/wr-core/build-intel-x86/tmp/work/
> x86_64-linux/iasl-native/20160527-r0/temp/log.do_compile.30670)
> NOTE: recipe iasl-native-20160527-r0: task do_compile: Failed
> ERROR: Task (virtual:native:/home/rpjday/github/pulsar/wr-core/layers/
> meta-virtualization/recipes-extended/iasl/iasl_20160527.bb:do_compile)
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 95 tasks of which 94 didn't need to be
> rerun and 1 failed.
>
> Summary: 1 task failed:
>   virtual:native:/home/rpjday/github/pulsar/wr-core/layers/
> meta-virtualization/recipes-extended/iasl/iasl_20160527.bb:do_compile
> Summary: There were 15 WARNING messages shown.
> Summary: There were 2 ERROR messages shown, returning a non-zero exit cod=
e.
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>


--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--00000000000098e0fd056fa505f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">How did it go with this ?<div><br></div><div>Looks like a =
gcc 8.x introduced build issue. Most likely an update to the package is req=
uired.</div><div><br></div><div>Bruce<br><div class=3D"gmail_extra"><br><di=
v class=3D"gmail_quote">On Fri, Jun 22, 2018 at 7:48 AM, Robert P. J. Day <=
span dir=3D"ltr">&lt;<a href=3D"mailto:rpjday@crashcourse.ca" target=3D"_bl=
ank">rpjday@crashcourse.ca</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><br>
=C2=A0 building with wind river&#39;s pulsar linux, target x86_64, and<br>
iasl-native build fails as below. this is with gcc-8.1.1, and this<br>
appears to be a generic enough issue that i thought i would ask about<br>
it here rather than at the pulsar linux github page.<br>
<br>
=C2=A0 thoughts?<br>
<br>
WARNING: Layer skeleton should set LAYERSERIES_COMPAT_skeleton in its conf/=
layer.conf file to list the core layer names it is compatible with.<br>
WARNING: Layer external-binaries should set LAYERSERIES_COMPAT_external-<wb=
r>binaries in its conf/layer.conf file to list the core layer names it is c=
ompatible with.<br>
WARNING: Layer refkit-extra should set LAYERSERIES_COMPAT_refkit-<wbr>extra=
 in its conf/layer.conf file to list the core layer names it is compatible =
with.<br>
WARNING: Layer iot-cloud should set LAYERSERIES_COMPAT_iot-cloud in its con=
f/layer.conf file to list the core layer names it is compatible with.<br>
WARNING: Layer metagw should set LAYERSERIES_COMPAT_metagw in its conf/laye=
r.conf file to list the core layer names it is compatible with.<br>
WARNING: Layer up-board should set LAYERSERIES_COMPAT_up-board in its conf/=
layer.conf file to list the core layer names it is compatible with.<br>
WARNING: Layer wrlabs-integration should set LAYERSERIES_COMPAT_wrlabs-<wbr=
>integration in its conf/layer.conf file to list the core layer names it is=
 compatible with.<br>
NOTE: Started PRServer with DBfile: /home/rpjday/github/pulsar/wr-<wbr>core=
/build-intel-x86/cache/<wbr>prserv.sqlite3, IP: 127.0.0.1, PORT: 35135, PID=
: 30586<br>
WARNING: Layer skeleton should set LAYERSERIES_COMPAT_skeleton in its conf/=
layer.conf file to list the core layer names it is compatible with.<br>
WARNING: Layer external-binaries should set LAYERSERIES_COMPAT_external-<wb=
r>binaries in its conf/layer.conf file to list the core layer names it is c=
ompatible with.<br>
WARNING: Layer refkit-extra should set LAYERSERIES_COMPAT_refkit-<wbr>extra=
 in its conf/layer.conf file to list the core layer names it is compatible =
with.<br>
WARNING: Layer iot-cloud should set LAYERSERIES_COMPAT_iot-cloud in its con=
f/layer.conf file to list the core layer names it is compatible with.<br>
WARNING: Layer metagw should set LAYERSERIES_COMPAT_metagw in its conf/laye=
r.conf file to list the core layer names it is compatible with.<br>
WARNING: Layer up-board should set LAYERSERIES_COMPAT_up-board in its conf/=
layer.conf file to list the core layer names it is compatible with.<br>
WARNING: Layer wrlabs-integration should set LAYERSERIES_COMPAT_wrlabs-<wbr=
>integration in its conf/layer.conf file to list the core layer names it is=
 compatible with.<br>
Loading cache...done.<br>
Loaded 4912 entries from dependency cache.<br>
Parsing recipes...done.<br>
Parsing of 3683 .bb files complete (3679 cached, 4 parsed). 4916 targets, 8=
9 skipped, 5 masked, 0 errors.<br>
WARNING: No recipes available for:<br>
=C2=A0 /home/rpjday/github/pulsar/wr-<wbr>core/layers/meta-cloud-<wbr>servi=
ces/meta-openstack/<wbr>recipes-extended/libvirt/<wbr>libvirt_1.%.bbappend<=
br>
=C2=A0 /home/rpjday/github/pulsar/wr-<wbr>core/layers/meta-cloud-<wbr>servi=
ces/meta-openstack/<wbr>recipes-kernel/linux/linux-<wbr>yocto_4.10.bbappend=
<br>
=C2=A0 /home/rpjday/github/pulsar/wr-<wbr>core/layers/meta-cloud-<wbr>servi=
ces/meta-openstack/<wbr>recipes-kernel/linux/linux-<wbr>yocto_4.4.bbappend<=
br>
=C2=A0 /home/rpjday/github/pulsar/wr-<wbr>core/layers/meta-cloud-<wbr>servi=
ces/meta-openstack/<wbr>recipes-kernel/linux/linux-<wbr>yocto_4.9.bbappend<=
br>
=C2=A0 /home/rpjday/github/pulsar/wr-<wbr>core/layers/meta-gateway/<wbr>rec=
ipes-core-luci/busybox/<wbr>busybox_1.22.1.bbappend<br>
=C2=A0 /home/rpjday/github/pulsar/wr-<wbr>core/layers/meta-gateway/<wbr>rec=
ipes-kernel/kernel/linux-<wbr>yocto-rt_4.9.bbappend<br>
=C2=A0 /home/rpjday/github/pulsar/wr-<wbr>core/layers/meta-gateway/<wbr>rec=
ipes-kernel/kernel/linux-<wbr>yocto_4.9.bbappend<br>
=C2=A0 /home/rpjday/github/pulsar/wr-<wbr>core/layers/meta-gateway/<wbr>rec=
ipes-navigation/gpsd/gpsd_<wbr>3.16.bbappend<br>
=C2=A0 /home/rpjday/github/pulsar/wr-<wbr>core/layers/wrlabs-<wbr>integrati=
on/recipes-bsp/shim/<wbr>shim_git.bbappend<br>
=C2=A0 /home/rpjday/github/pulsar/wr-<wbr>core/layers/wrlabs-<wbr>integrati=
on/recipes-<wbr>containers/lxc/lxc_2.0.%.<wbr>bbappend<br>
=C2=A0 /home/rpjday/github/pulsar/wr-<wbr>core/layers/wrlabs-<wbr>integrati=
on/recipes-core/dbus/<wbr>dbus_1.10.20.bbappend<br>
=C2=A0 /home/rpjday/github/pulsar/wr-<wbr>core/layers/wrlabs-<wbr>integrati=
on/recipes-core/util-<wbr>linux/util-linux_2.30.bbappend<br>
=C2=A0 /home/rpjday/github/pulsar/wr-<wbr>core/layers/wrlabs-<wbr>integrati=
on/recipes-extended/<wbr>libsolv/libsolv_0.6.28.<wbr>bbappend<br>
=C2=A0 /home/rpjday/github/pulsar/wr-<wbr>core/layers/wrlabs-<wbr>integrati=
on/recipes-extended/<wbr>libvirt/libvirt_1.3.5.bbappend<br>
=C2=A0 /home/rpjday/github/pulsar/wr-<wbr>core/layers/wrlabs-<wbr>integrati=
on/recipes-extended/<wbr>man-pages/man-pages_4.11.<wbr>bbappend<br>
=C2=A0 /home/rpjday/github/pulsar/wr-<wbr>core/layers/wrlabs-<wbr>integrati=
on/recipes-hac/<wbr>haccmds/haccmds_1.0.bbappend<br>
=C2=A0 /home/rpjday/github/pulsar/wr-<wbr>core/layers/wrlabs-<wbr>integrati=
on/recipes-kernel/<wbr>linux/linux-yocto-rt_4.9.<wbr>bbappend<br>
=C2=A0 /home/rpjday/github/pulsar/wr-<wbr>core/layers/wrlabs-<wbr>integrati=
on/recipes-kernel/<wbr>linux/linux-yocto_4.9.bbappend<br>
NOTE: Multiple providers are available for iasl-native (iasl-native, acpica=
-native)<br>
Consider defining a PREFERRED_PROVIDER entry to match iasl-native<br>
NOTE: Resolving any missing task queue dependencies<br>
<br>
Build Configuration:<br>
BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;1.39.0&quot;<b=
r>
BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-linux&q=
uot;<br>
NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D &quot;fedora-28&quot;<br>
TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-wrs-lin=
ux&quot;<br>
MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;intel-cor=
ei7-64&quot;<br>
DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;Puls=
ar-Linux&quot;<br>
DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;10.17.41.1&quot;<br>
TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;m64 core2&quot;<br>
TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;&quot;<br>
meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot=
;HEAD:<wbr>b34e86b4ee13d53f09d558e613d5b6<wbr>6c845edde6&quot;<br>
oe-meta-go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;HEAD:<wbr>b29b=
384eae4a40933d07cc64c51e89<wbr>0c289d9621&quot;<br>
meta-virtualization=C2=A0 =3D &quot;HEAD:<wbr>8344dd9e9f55a5ea81f9c57c74bd9=
a<wbr>8b9a04e8ad&quot;<br>
external-binaries=C2=A0 =C2=A0 =3D &quot;HEAD:<wbr>78d4168b29efe5e812c36502=
a1c300<wbr>d3d4c45935&quot;<br>
meta-xfce<br>
meta-webserver<br>
meta-perl<br>
meta-python<br>
meta-oe<br>
meta-gnome<br>
meta-multimedia<br>
meta-networking<br>
meta-filesystems<br>
meta-initramfs=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;HEAD:<wbr>a4056a96ecc857=
b1d675b89dc35cf9<wbr>ed8a876f80&quot;<br>
meta-refkit-extra=C2=A0 =C2=A0 =3D &quot;HEAD:<wbr>4ca2e7474b046fa0bd7813cd=
6da7cf<wbr>455733d61c&quot;<br>
meta-dpdk=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;HEAD:<wbr>8a0f=
847836671111915088d2838e3f<wbr>f6f3c7642c&quot;<br>
meta-java=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;HEAD:<wbr>aa27=
6b00d8a6bbffffd59d1980153c<wbr>99521ce6ea&quot;<br>
meta-iot-cloud=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;HEAD:<wbr>6039a7a8a9a0ca=
d4e32736be3a05a5<wbr>29b65e126a&quot;<br>
meta-security=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;HEAD:<wbr>f9c5e2022b5409=
7474e46d9efb5408<wbr>0bd0e4d606&quot;<br>
meta-browser=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;HEAD:<wbr>1cd38d701=
a49eade80a04140f70d33<wbr>83117b9745&quot;<br>
meta-openstack<br>
meta-cloud-services=C2=A0 =3D &quot;HEAD:<wbr>31e3086409b5055b8ce5962a614f1=
2<wbr>84003c513d&quot;<br>
meta-cube=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;HEAD:<wbr>62f0=
3f7d42f784923a8b02ce9d30d6<wbr>2d6552a22b&quot;<br>
meta-gateway=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;HEAD:<wbr>48dae0603=
506cff9bde674755d963e<wbr>5cf3e75244&quot;<br>
meta-up-board=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;HEAD:<wbr>024d0f5e404cb2=
9789c2bba90aa72e<wbr>fd00f2a0e6&quot;<br>
meta-intel=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;HEAD:<wbr>fec5=
d45ec3978d4b7c9649bee45fe5<wbr>8f914bcee4&quot;<br>
wrlabs-integration=C2=A0 =C2=A0=3D &quot;HEAD:<wbr>02e0f675db192294044ffbce=
6146ec<wbr>25f34ffdba&quot;<br>
<br>
Initialising tasks...done.<br>
NOTE: Executing SetScene Tasks<br>
NOTE: Executing RunQueue Tasks<br>
NOTE: Running task 94 of 98 (virtual:native:/home/rpjday/<wbr>github/pulsar=
/wr-core/layers/<wbr>meta-virtualization/recipes-<wbr>extended/iasl/iasl_20=
160527.<wbr>bb:do_compile)<br>
NOTE: recipe iasl-native-20160527-r0: task do_compile: Started<br>
ERROR: iasl-native-20160527-r0 do_compile: oe_runmake failed<br>
ERROR: iasl-native-20160527-r0 do_compile: Function failed: do_compile (log=
 file is located at /home/rpjday/github/pulsar/wr-<wbr>core/build-intel-x86=
/tmp/work/<wbr>x86_64-linux/iasl-native/<wbr>20160527-r0/temp/log.do_<wbr>c=
ompile.30670)<br>
ERROR: Logfile of failure stored in: /home/rpjday/github/pulsar/wr-<wbr>cor=
e/build-intel-x86/tmp/work/<wbr>x86_64-linux/iasl-native/<wbr>20160527-r0/t=
emp/log.do_<wbr>compile.30670<br>
Log data follows:<br>
| DEBUG: Executing shell function do_compile<br>
| NOTE: make -j 8 iasl NOOPT=3DTRUE NOFORTIFY=3DTRUE<br>
| make[1]: Entering directory &#39;/home/rpjday/github/pulsar/<wbr>wr-core/=
build-intel-x86/tmp/<wbr>work/x86_64-linux/iasl-native/<wbr>20160527-r0/acp=
ica-unix-<wbr>20160527/generate/unix/iasl&#39;<br>
| gcc=C2=A0 -c -isystem/home/rpjday/github/<wbr>pulsar/wr-core/build-intel-=
<wbr>x86/tmp/work/x86_64-linux/<wbr>iasl-native/20160527-r0/<wbr>recipe-sys=
root-native/usr/<wbr>include -O2 -pipe -D_CYGWIN -D_GNU_SOURCE -I../../../s=
ource/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/include -DACPI_ASL_=
COMPILER -I../../../source/compiler -Iobj -std=3Dc99 -Wall -Wbad-function-c=
ast -Wdeclaration-after-statement -Werror -Wformat=3D2 -Wmissing-declaratio=
ns -Wmissing-prototypes -Wstrict-aliasing=3D0 -Wstrict-prototypes -Wswitch-=
default -Wpointer-arith -Wundef -Waddress -Waggregate-return -Winit-self -W=
inline -Wmissing-declarations -Wmissing-field-initializers -Wnested-externs=
 -Wold-style-definition -Wno-format-nonliteral -Wredundant-decls -Wempty-bo=
dy -Woverride-init -Wlogical-op -Wmissing-parameter-type -Wold-style-declar=
ation -Wtype-limits -o obj/aslanalyze.o ../../../source/compiler/<wbr>aslan=
alyze.c<br>
| gcc=C2=A0 -c -isystem/home/rpjday/github/<wbr>pulsar/wr-core/build-intel-=
<wbr>x86/tmp/work/x86_64-linux/<wbr>iasl-native/20160527-r0/<wbr>recipe-sys=
root-native/usr/<wbr>include -O2 -pipe -D_CYGWIN -D_GNU_SOURCE -I../../../s=
ource/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/include -DACPI_ASL_=
COMPILER -I../../../source/compiler -Iobj -std=3Dc99 -Wall -Wbad-function-c=
ast -Wdeclaration-after-statement -Werror -Wformat=3D2 -Wmissing-declaratio=
ns -Wmissing-prototypes -Wstrict-aliasing=3D0 -Wstrict-prototypes -Wswitch-=
default -Wpointer-arith -Wundef -Waddress -Waggregate-return -Winit-self -W=
inline -Wmissing-declarations -Wmissing-field-initializers -Wnested-externs=
 -Wold-style-definition -Wno-format-nonliteral -Wredundant-decls -Wempty-bo=
dy -Woverride-init -Wlogical-op -Wmissing-parameter-type -Wold-style-declar=
ation -Wtype-limits -o obj/aslcodegen.o ../../../source/compiler/<wbr>aslco=
degen.c<br>
| gcc=C2=A0 -c -isystem/home/rpjday/github/<wbr>pulsar/wr-core/build-intel-=
<wbr>x86/tmp/work/x86_64-linux/<wbr>iasl-native/20160527-r0/<wbr>recipe-sys=
root-native/usr/<wbr>include -O2 -pipe -D_CYGWIN -D_GNU_SOURCE -I../../../s=
ource/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/include -DACPI_ASL_=
COMPILER -I../../../source/compiler -Iobj -std=3Dc99 -Wall -Wbad-function-c=
ast -Wdeclaration-after-statement -Werror -Wformat=3D2 -Wmissing-declaratio=
ns -Wmissing-prototypes -Wstrict-aliasing=3D0 -Wstrict-prototypes -Wswitch-=
default -Wpointer-arith -Wundef -Waddress -Waggregate-return -Winit-self -W=
inline -Wmissing-declarations -Wmissing-field-initializers -Wnested-externs=
 -Wold-style-definition -Wno-format-nonliteral -Wredundant-decls -Wempty-bo=
dy -Woverride-init -Wlogical-op -Wmissing-parameter-type -Wold-style-declar=
ation -Wtype-limits -o obj/aslpredef.o ../../../source/compiler/<wbr>aslpre=
def.c<br>
| gcc=C2=A0 -c -isystem/home/rpjday/github/<wbr>pulsar/wr-core/build-intel-=
<wbr>x86/tmp/work/x86_64-linux/<wbr>iasl-native/20160527-r0/<wbr>recipe-sys=
root-native/usr/<wbr>include -O2 -pipe -D_CYGWIN -D_GNU_SOURCE -I../../../s=
ource/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/include -DACPI_ASL_=
COMPILER -I../../../source/compiler -Iobj -std=3Dc99 -Wall -Wbad-function-c=
ast -Wdeclaration-after-statement -Werror -Wformat=3D2 -Wmissing-declaratio=
ns -Wmissing-prototypes -Wstrict-aliasing=3D0 -Wstrict-prototypes -Wswitch-=
default -Wpointer-arith -Wundef -Waddress -Waggregate-return -Winit-self -W=
inline -Wmissing-declarations -Wmissing-field-initializers -Wnested-externs=
 -Wold-style-definition -Wno-format-nonliteral -Wredundant-decls -Wempty-bo=
dy -Woverride-init -Wlogical-op -Wmissing-parameter-type -Wold-style-declar=
ation -Wtype-limits -o obj/aslprepkg.o ../../../source/compiler/<wbr>aslpre=
pkg.c<br>
| gcc=C2=A0 -c -isystem/home/rpjday/github/<wbr>pulsar/wr-core/build-intel-=
<wbr>x86/tmp/work/x86_64-linux/<wbr>iasl-native/20160527-r0/<wbr>recipe-sys=
root-native/usr/<wbr>include -O2 -pipe -D_CYGWIN -D_GNU_SOURCE -I../../../s=
ource/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/include -DACPI_ASL_=
COMPILER -I../../../source/compiler -Iobj -std=3Dc99 -Wall -Wbad-function-c=
ast -Wdeclaration-after-statement -Werror -Wformat=3D2 -Wmissing-declaratio=
ns -Wmissing-prototypes -Wstrict-aliasing=3D0 -Wstrict-prototypes -Wswitch-=
default -Wpointer-arith -Wundef -Waddress -Waggregate-return -Winit-self -W=
inline -Wmissing-declarations -Wmissing-field-initializers -Wnested-externs=
 -Wold-style-definition -Wno-format-nonliteral -Wredundant-decls -Wempty-bo=
dy -Woverride-init -Wlogical-op -Wmissing-parameter-type -Wold-style-declar=
ation -Wtype-limits -o obj/aslprintf.o ../../../source/compiler/<wbr>aslpri=
ntf.c<br>
| gcc=C2=A0 -c -isystem/home/rpjday/github/<wbr>pulsar/wr-core/build-intel-=
<wbr>x86/tmp/work/x86_64-linux/<wbr>iasl-native/20160527-r0/<wbr>recipe-sys=
root-native/usr/<wbr>include -O2 -pipe -D_CYGWIN -D_GNU_SOURCE -I../../../s=
ource/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/include -DACPI_ASL_=
COMPILER -I../../../source/compiler -Iobj -std=3Dc99 -Wall -Wbad-function-c=
ast -Wdeclaration-after-statement -Werror -Wformat=3D2 -Wmissing-declaratio=
ns -Wmissing-prototypes -Wstrict-aliasing=3D0 -Wstrict-prototypes -Wswitch-=
default -Wpointer-arith -Wundef -Waddress -Waggregate-return -Winit-self -W=
inline -Wmissing-declarations -Wmissing-field-initializers -Wnested-externs=
 -Wold-style-definition -Wno-format-nonliteral -Wredundant-decls -Wempty-bo=
dy -Woverride-init -Wlogical-op -Wmissing-parameter-type -Wold-style-declar=
ation -Wtype-limits -o obj/aslprune.o ../../../source/compiler/<wbr>aslprun=
e.c<br>
| gcc=C2=A0 -c -isystem/home/rpjday/github/<wbr>pulsar/wr-core/build-intel-=
<wbr>x86/tmp/work/x86_64-linux/<wbr>iasl-native/20160527-r0/<wbr>recipe-sys=
root-native/usr/<wbr>include -O2 -pipe -D_CYGWIN -D_GNU_SOURCE -I../../../s=
ource/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/include -DACPI_ASL_=
COMPILER -I../../../source/compiler -Iobj -std=3Dc99 -Wall -Wbad-function-c=
ast -Wdeclaration-after-statement -Werror -Wformat=3D2 -Wmissing-declaratio=
ns -Wmissing-prototypes -Wstrict-aliasing=3D0 -Wstrict-prototypes -Wswitch-=
default -Wpointer-arith -Wundef -Waddress -Waggregate-return -Winit-self -W=
inline -Wmissing-declarations -Wmissing-field-initializers -Wnested-externs=
 -Wold-style-definition -Wno-format-nonliteral -Wredundant-decls -Wempty-bo=
dy -Woverride-init -Wlogical-op -Wmissing-parameter-type -Wold-style-declar=
ation -Wtype-limits -o obj/aslresource.o ../../../source/compiler/<wbr>aslr=
esource.c<br>
| gcc=C2=A0 -c -isystem/home/rpjday/github/<wbr>pulsar/wr-core/build-intel-=
<wbr>x86/tmp/work/x86_64-linux/<wbr>iasl-native/20160527-r0/<wbr>recipe-sys=
root-native/usr/<wbr>include -O2 -pipe -D_CYGWIN -D_GNU_SOURCE -I../../../s=
ource/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/include -DACPI_ASL_=
COMPILER -I../../../source/compiler -Iobj -std=3Dc99 -Wall -Wbad-function-c=
ast -Wdeclaration-after-statement -Werror -Wformat=3D2 -Wmissing-declaratio=
ns -Wmissing-prototypes -Wstrict-aliasing=3D0 -Wstrict-prototypes -Wswitch-=
default -Wpointer-arith -Wundef -Waddress -Waggregate-return -Winit-self -W=
inline -Wmissing-declarations -Wmissing-field-initializers -Wnested-externs=
 -Wold-style-definition -Wno-format-nonliteral -Wredundant-decls -Wempty-bo=
dy -Woverride-init -Wlogical-op -Wmissing-parameter-type -Wold-style-declar=
ation -Wtype-limits -o obj/aslrestype1.o ../../../source/compiler/<wbr>aslr=
estype1.c<br>
| In function =E2=80=98CgWriteTableHeader=E2=80=99,<br>
|=C2=A0 =C2=A0 =C2=A0inlined from =E2=80=98CgWriteNode=E2=80=99 at ../../..=
/source/compiler/<wbr>aslcodegen.c:715:9,<br>
|=C2=A0 =C2=A0 =C2=A0inlined from =E2=80=98CgAmlWriteWalk=E2=80=99 at ../..=
/../source/compiler/<wbr>aslcodegen.c:207:5:<br>
| ../../../source/compiler/<wbr>aslcodegen.c:500:5: error: =E2=80=98strncpy=
=E2=80=99 specified bound 4 equals destination size [-Werror=3Dstringop-tru=
ncation]<br>
|=C2=A0 =C2=A0 =C2=A0 strncpy (TableHeader.Signature, Child-&gt;Asl.Value.S=
tring, 4);<br>
|=C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<wbr>~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~<br>
| ../../../source/compiler/<wbr>aslcodegen.c:517:5: error: =E2=80=98strncpy=
=E2=80=99 specified bound 6 equals destination size [-Werror=3Dstringop-tru=
ncation]<br>
|=C2=A0 =C2=A0 =C2=A0 strncpy (TableHeader.OemId, Child-&gt;Asl.Value.Strin=
g, 6);<br>
|=C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<wbr>~~~~~~~~~~~~~~~~~~=
~~~~~~~<br>
| ../../../source/compiler/<wbr>aslcodegen.c:522:5: error: =E2=80=98strncpy=
=E2=80=99 specified bound 8 equals destination size [-Werror=3Dstringop-tru=
ncation]<br>
|=C2=A0 =C2=A0 =C2=A0 strncpy (TableHeader.OemTableId, Child-&gt;Asl.Value.=
String, 8);<br>
|=C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<wbr>~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~<br>
| ../../../source/compiler/<wbr>aslpredef.c: In function =E2=80=98ApCheckFo=
rPredefinedMethod=E2=80=99:<br>
| ../../../source/compiler/<wbr>aslpredef.c:237:33: error: =E2=80=98 requir=
ed for =E2=80=99 directive writing 14 bytes into a region of size between 1=
 and 4096 [-Werror=3Dformat-overflow=3D]<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf (MsgBuffer, &quot=
;%s required for %4.4s&quot;,<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~<br>
| ../../../source/compiler/<wbr>aslpredef.c:237:13: note: =E2=80=98sprintf=
=E2=80=99 output between 19 and 4114 bytes into a destination of size 4096<=
br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf (MsgBuffer, &quot=
;%s required for %4.4s&quot;,<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~<wbr>~~~~~~~~~~~~~~<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 StringBuffe=
r, ThisName-&gt;Info.Name);<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~<wbr>~~~~<br>
| ../../../source/compiler/<wbr>aslanalyze.c: In function =E2=80=98AnCheckM=
ethodReturnValue=E2=80=99:<br>
| ../../../source/compiler/<wbr>aslanalyze.c:431:17: error: =E2=80=98%s=E2=
=80=99 directive writing up to 4095 bytes into a region of size 4080 [-Werr=
or=3Dformat-overflow=3D]<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Metho=
d returns [%s], %s operator requires [%s]&quot;,<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~<wbr>~~~~~~~~~~~~~~~~~~<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 StringBuffe=
r, OpInfo-&gt;Name, StringBuffer2);<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~~~~~~~~~~~=
~<br>
| ../../../source/compiler/<wbr>aslanalyze.c:430:13: note: =E2=80=98sprintf=
=E2=80=99 output 41 or more bytes (assuming 8231) into a destination of siz=
e 4096<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf (MsgBuffer,<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Metho=
d returns [%s], %s operator requires [%s]&quot;,<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~<wbr>~~~~~~~~~~~~~~~~~~~<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 StringBuffe=
r, OpInfo-&gt;Name, StringBuffer2);<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~<wbr>~~~~~~~~~~~~<br>
| ../../../source/compiler/<wbr>aslpredef.c: In function =E2=80=98ApCheckOb=
jectType=E2=80=99:<br>
| ../../../source/compiler/<wbr>aslpredef.c:780:29: error: =E2=80=98%s=E2=
=80=99 directive writing up to 4095 bytes into a region of size between 405=
6 and 4071 [-Werror=3Dformat-overflow=3D]<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf (MsgBuffer, &quot;%4.4s: found =
%s at index %u, %s required&quot;,<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<wbr>~~~~~~~~=
~~~~<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PredefinedName, TypeName,=
 PackageIndex, StringBuffer);<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~~~~~~~~~~~~<br>
| ../../../source/compiler/<wbr>aslpredef.c:780:9: note: =E2=80=98sprintf=
=E2=80=99 output 35 or more bytes (assuming 4145) into a destination of siz=
e 4096<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf (MsgBuffer, &quot;%4.4s: found =
%s at index %u, %s required&quot;,<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<wbr>~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~<wbr>~~~<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PredefinedName, TypeName,=
 PackageIndex, StringBuffer);<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~<wbr>~~~~~~~~~~~~~~~~~~~~~~~<br>
| ../../../source/compiler/<wbr>aslpredef.c:775:29: error: =E2=80=98%s=E2=
=80=99 directive writing up to 4095 bytes into a region of size between 407=
6 and 4082 [-Werror=3Dformat-overflow=3D]<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf (MsgBuffer, &quot;%4.4s: found =
%s, %s required&quot;,<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PredefinedName, TypeName,=
 StringBuffer);<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~~~~~~~~=
~~~~<br>
| ../../../source/compiler/<wbr>aslpredef.c:775:9: note: =E2=80=98sprintf=
=E2=80=99 output 24 or more bytes (assuming 4125) into a destination of siz=
e 4096<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf (MsgBuffer, &quot;%4.4s: found =
%s, %s required&quot;,<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<wbr>~~~~=
~~~~~~~~~~~~~~~~~<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PredefinedName, TypeName,=
 StringBuffer);<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~<wbr>~~~~~~~~~<br>
| cc1: all warnings being treated as errors<br>
| make[1]: *** [../Makefile.rules:18: obj/aslcodegen.o] Error 1<br>
| make[1]: *** Waiting for unfinished jobs....<br>
| cc1: all warnings being treated as errors<br>
| make[1]: *** [../Makefile.rules:18: obj/aslanalyze.o] Error 1<br>
| cc1: all warnings being treated as errors<br>
| make[1]: *** [../Makefile.rules:18: obj/aslpredef.o] Error 1<br>
| make[1]: Leaving directory &#39;/home/rpjday/github/pulsar/<wbr>wr-core/b=
uild-intel-x86/tmp/<wbr>work/x86_64-linux/iasl-native/<wbr>20160527-r0/acpi=
ca-unix-<wbr>20160527/generate/unix/iasl&#39;<br>
| make: *** [generate/unix/Makefile.<wbr>common:25: iasl] Error 2<br>
| ERROR: oe_runmake failed<br>
| WARNING: /home/rpjday/github/pulsar/wr-<wbr>core/build-intel-x86/tmp/work=
/<wbr>x86_64-linux/iasl-native/<wbr>20160527-r0/temp/run.do_<wbr>compile.30=
670:1 exit 1 from &#39;exit 1&#39;<br>
| ERROR: Function failed: do_compile (log file is located at /home/rpjday/g=
ithub/pulsar/wr-<wbr>core/build-intel-x86/tmp/work/<wbr>x86_64-linux/iasl-n=
ative/<wbr>20160527-r0/temp/log.do_<wbr>compile.30670)<br>
NOTE: recipe iasl-native-20160527-r0: task do_compile: Failed<br>
ERROR: Task (virtual:native:/home/rpjday/<wbr>github/pulsar/wr-core/layers/=
<wbr>meta-virtualization/recipes-<wbr>extended/iasl/iasl_20160527.<wbr>bb:d=
o_compile) failed with exit code &#39;1&#39;<br>
NOTE: Tasks Summary: Attempted 95 tasks of which 94 didn&#39;t need to be r=
erun and 1 failed.<br>
<br>
Summary: 1 task failed:<br>
=C2=A0 virtual:native:/home/rpjday/<wbr>github/pulsar/wr-core/layers/<wbr>m=
eta-virtualization/recipes-<wbr>extended/iasl/iasl_20160527.<wbr>bb:do_comp=
ile<br>
Summary: There were 15 WARNING messages shown.<br>
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.=
<br>-- <br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
<br></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div cla=
ss=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt =
not follow the NULL pointer, for chaos and madness await thee at its end&qu=
ot;</div>
</div></div></div>

--00000000000098e0fd056fa505f9--
