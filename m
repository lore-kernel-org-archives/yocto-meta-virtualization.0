Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.741.1583261765862004171
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Mar 2020 10:56:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oSCuD2fS;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id q8so5800516wrm.4
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 03 Mar 2020 10:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yu7zmF+wCLTH1WMcPw98QsT1GX9p79/7eAGMoVUyNA8=;
        b=oSCuD2fSSQOnpE15oEEUZrBOv9v4uR73ePe0lPYnmzJd0MH0V4g8Q18KnXp9Z8bImn
         M6CPwU+jI2UyDZA9/UoJL9A1vLDZ0mxFuFhL5WnKxb1+qTeeybM2o+Q0+cxFz7NTLzaB
         dSkwU3nD5UL8kkgFQPgBQfczZRmTdTwnUh6E3QfzuKbuS9edUkKAKCBweSitz0ZwC6p6
         sB68MZSNhMWoLxg9AhFFY9EXXWS+Qa+9ZhehxtIAtaI2UVTWySQcVltQQ9HWB/1DmP6W
         FQEuKsYq4gAWU3q41Cie6ApkaXPnIOAplTzjFOi0x3lifDW/scVQq/h9jid3nrqSPr7P
         /UNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yu7zmF+wCLTH1WMcPw98QsT1GX9p79/7eAGMoVUyNA8=;
        b=uL4MY5bm4jQ//KEprSVOXbxWJF67nuLT22GOvSXw1/Z73OwiBElQ/EUKjs1lssGTan
         5qfRxL/khKbP7UWnz3pAtIl5sOsKFmhQARyI7UCutjdbSkDi4dHZ3etCcgVsSp2vt9GP
         Wbs+6rPidDsuhsEPUnJQAtauOtdR8QbCVBzPsgrYqPyYlA8MhpMBBmtkf9kLG9ixb0qa
         nrV4Vvck6vZIw3bkBTIBUNNP3yzGPKB5Jp7WA37kP0b5kipoLclZESJ2zpeOrxoKBZtq
         CmCU3KVXif1KQOOoEbdEicq5XGEBb90UAT0IS9Tt2Iiu+4IKfqiTL35bZylJByUfPpKE
         BWKA==
X-Gm-Message-State: ANhLgQ2ckoA5wPsx4FmDDwDzKkpJo8CQsUwCDJ37ZkcAJ+pm5kCpCwHG
	9sV9KZEUHhVz9sjrb/uaaf0=
X-Google-Smtp-Source: ADFU+vvbwGGPk7qhf30bb9aQy6dxUp1NnermAL0ePPlBHs5eBqPUyWquzbwT14Go1LIKTRAbmCtcoA==
X-Received: by 2002:adf:ec52:: with SMTP id w18mr6660854wrn.26.1583261764255;
        Tue, 03 Mar 2020 10:56:04 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id f3sm4639658wrs.26.2020.03.03.10.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 10:56:03 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 3 Mar 2020 19:56:02 +0100
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Martin Jansa <martin.jansa@lge.com>
Subject: Re: [meta-virtualization][PATCH] hyperstart: refresh 0001-container.c-Fix-compiler-errors-that-gcc-8.1.0-repor.patch to apply cleanly
Message-ID: <20200303185602.lsnasux2swhn4sy3@jama>
References: <20200303151723.8364-1-Martin.Jansa@gmail.com>
 <CACMJ4GbY984JBnKMwCKJx4rHy5ONPoXe6zKxdYfCjqO2HJWsYA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACMJ4GbY984JBnKMwCKJx4rHy5ONPoXe6zKxdYfCjqO2HJWsYA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Groupsio-MsgNum: 5190
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ll6cxkvkg655aolp"
Content-Disposition: inline

--ll6cxkvkg655aolp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2020 at 10:47:23AM -0800, Christopher Clark wrote:
> On Tue, Mar 3, 2020 at 7:17 AM Martin Jansa <Martin.Jansa@gmail.com> wro=
te:
> >
> > From: Martin Jansa <martin.jansa@lge.com>
> >
> > ERROR: hyperstart-v0.2+gitAUTOINC+15bb718ad3-r0 do_patch: Fuzz detecte=
d:
> >
> > Applying patch 0001-container.c-Fix-compiler-errors-that-gcc-8.1.0-rep=
or.patch
> > patching file src/container.c
> > Hunk #2 succeeded at 118 with fuzz 1 (offset 17 lines).
> > Hunk #3 succeeded at 148 (offset 18 lines).
> > Hunk #4 succeeded at 158 (offset 18 lines).
> > Hunk #5 succeeded at 167 with fuzz 1 (offset 18 lines).
> > Hunk #6 succeeded at 197 (offset 20 lines).
> > Hunk #7 succeeded at 222 (offset 20 lines).
> > Hunk #8 succeeded at 240 (offset 20 lines).
> > Hunk #9 succeeded at 277 (offset 20 lines).
> > Hunk #10 succeeded at 285 (offset 20 lines).
> > Hunk #11 succeeded at 325 (offset 27 lines).
> > Hunk #12 succeeded at 583 (offset 30 lines).
> > Hunk #13 succeeded at 646 (offset 30 lines).
> > Hunk #14 succeeded at 664 (offset 30 lines).
> > Hunk #15 succeeded at 749 (offset 30 lines).
> > Hunk #16 succeeded at 769 (offset 30 lines).
> > Hunk #17 succeeded at 778 (offset 30 lines).
> >
> > The context lines in the patches can be updated with devtool:
> >
> >     devtool modify hyperstart
> >     devtool finish --force-patch-refresh hyperstart <layer_path>
> >
> > Don't forget to review changes done by devtool!
> >
> > ERROR: hyperstart-v0.2+gitAUTOINC+15bb718ad3-r0 do_patch: QA Issue: Pa=
tch log indicates that patches do not apply cleanly. [patch-fuzz]
>=20
> Is version 0.2 still accurate for this revision of hyperstart?

Probably not as
https://github.com/hyperhq/hyperstart/blob/15bb718ad34045aa1962a8204f602c6=
afe9a76ab/configure.ac
shows:
AC_INIT([hyperstart], [1.0.0], [www.hyper.sh])

But I'm not changing SRCREV, just fixing the patch to apply (as my world
builds have patch-fuzz in ERROR_QA)

It was last upgraded in:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/recip=
es-extended/hyperstart?id=3D4bded63c2ec35a6c2aa3276f83519925e8669663
which probably caused the patch to not apply cleanly, but the version
was 1.0.0 in the old SRCREV already:
https://github.com/hyperhq/hyperstart/blob/ad48a3230836f59ada163659cde151a=
37522068b/configure.ac

So it was probably incorrect since the recipe was introduced in:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/recip=
es-extended/hyperstart?id=3Dfcffb627a7831a53b5f817848e4d1f1a140b9eb5

I'll leave fixing it to someone actually using hyperstart (I just didn't
want to blacklist it in our builds just because of patch-fuzz).

Cheers,
>=20
> Christopher
>=20
>=20
> >
> > Signed-off-by: Martin Jansa <martin.jansa@lge.com>
> > ---
> >  ...compiler-errors-that-gcc-8.1.0-repor.patch | 44 +++++++++---------=
-
> >  1 file changed, 21 insertions(+), 23 deletions(-)
> >
> > diff --git a/recipes-extended/hyperstart/hyperstart/0001-container.c-F=
ix-compiler-errors-that-gcc-8.1.0-repor.patch b/recipes-extended/hyperstart=
/hyperstart/0001-container.c-Fix-compiler-errors-that-gcc-8.1.0-repor.patch
> > index 4a01de5..091ce3c 100644
> > --- a/recipes-extended/hyperstart/hyperstart/0001-container.c-Fix-comp=
iler-errors-that-gcc-8.1.0-repor.patch
> > +++ b/recipes-extended/hyperstart/hyperstart/0001-container.c-Fix-comp=
iler-errors-that-gcc-8.1.0-repor.patch
> > @@ -1,4 +1,4 @@
> > -From 11f5089300c1c368d896c95890827dc85a67f132 Mon Sep 17 00:00:00 200=
1
> > +From 085dd65bba063e391350487f2a5e4a7bf69ee6c8 Mon Sep 17 00:00:00 200=
1
> >  From: Jason Wessel <jason.wessel@windriver.com>
> >  Date: Fri, 15 Jun 2018 08:04:35 -0700
> >  Subject: [PATCH] container.c: Fix compiler errors that gcc 8.1.0 repo=
rts
> > @@ -47,12 +47,13 @@ container.c:176:4: note: 'sprintf' output 9 or mor=
e bytes (assuming 520) into a
> >      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> >  Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> > +
> >  ---
> >   src/container.c | 47 ++++++++++++++++++++++++++++-------------------
> >   1 file changed, 28 insertions(+), 19 deletions(-)
> >
> >  diff --git a/src/container.c b/src/container.c
> > -index 0938d82..b1c52d4 100644
> > +index fee67ff..94d49d8 100644
> >  --- a/src/container.c
> >  +++ b/src/container.c
> >  @@ -22,6 +22,8 @@
> > @@ -64,7 +65,7 @@ index 0938d82..b1c52d4 100644
> >   static int container_populate_volume(char *src, char *dest)
> >   {
> >         struct stat st;
> > -@@ -99,12 +101,12 @@ static int container_setup_volume(struct hyper_p=
od *pod,
> > +@@ -116,12 +118,12 @@ static int container_setup_volume(struct hyper_=
pod *pod,
> >                                   struct hyper_container *container)
> >   {
> >         int i;
> > @@ -79,8 +80,8 @@ index 0938d82..b1c52d4 100644
> >  +              char mountpoint[MAX_PBUF];
> >                 char *options =3D NULL;
> >                 const char *filevolume =3D NULL;
> > -               vol =3D &container->vols[i];
> > -@@ -128,7 +130,8 @@ static int container_setup_volume(struct hyper_po=
d *pod,
> > +               bool newvolume =3D false;
> > +@@ -146,7 +148,8 @@ static int container_setup_volume(struct hyper_po=
d *pod,
> >                         if (hyper_mount_nfs(vol->device, path) < 0)
> >                                 return -1;
> >                         /* nfs export has implicitly included _data pa=
rt of the volume */
> > @@ -90,7 +91,7 @@ index 0938d82..b1c52d4 100644
> >                 } else {
> >                         fprintf(stdout, "mount %s to %s, tmp path %s\n=
",
> >                                 dev, vol->mountpoint, path);
> > -@@ -137,7 +140,7 @@ static int container_setup_volume(struct hyper_po=
d *pod,
> > +@@ -155,7 +158,7 @@ static int container_setup_volume(struct hyper_po=
d *pod,
> >                                 options =3D "nouuid";
> >
> >                         if (access(dev, R_OK) < 0) {
> > @@ -99,7 +100,7 @@ index 0938d82..b1c52d4 100644
> >                                 sprintf(device, "/block/%s", vol->devi=
ce);
> >                                 hyper_netlink_wait_dev(pod->ueventfd, =
device);
> >                         }
> > -@@ -146,7 +149,8 @@ static int container_setup_volume(struct hyper_po=
d *pod,
> > +@@ -164,7 +167,8 @@ static int container_setup_volume(struct hyper_po=
d *pod,
> >                                 perror("mount volume device failed");
> >                                 return -1;
> >                         }
> > @@ -108,8 +109,8 @@ index 0938d82..b1c52d4 100644
> >  +                                return -1;
> >                 }
> >
> > -               if (container_check_file_volume(volume, &filevolume) <=
 0)
> > -@@ -173,7 +177,8 @@ static int container_setup_volume(struct hyper_po=
d *pod,
> > +               if (container_check_volume(volume, &filevolume, &newvo=
lume) < 0)
> > +@@ -193,7 +197,8 @@ static int container_setup_volume(struct hyper_po=
d *pod,
> >                                 perror("create volume file failed");
> >                                 return -1;
> >                         }
> > @@ -119,7 +120,7 @@ index 0938d82..b1c52d4 100644
> >                         /* 0777 so that any user can read/write the ne=
w file volume */
> >                         if (chmod(volume, 0777) < 0) {
> >                                 fprintf(stderr, "fail to chmod directo=
ry %s\n", volume);
> > -@@ -197,9 +202,9 @@ static int container_setup_volume(struct hyper_po=
d *pod,
> > +@@ -217,9 +222,9 @@ static int container_setup_volume(struct hyper_po=
d *pod,
> >
> >         for (i =3D 0; i < container->maps_num; i++) {
> >                 struct stat st;
> > @@ -131,7 +132,7 @@ index 0938d82..b1c52d4 100644
> >
> >                 sprintf(path, "%s/%s", SHARED_DIR, map->source);
> >                 sprintf(mountpoint, "./%s", map->path);
> > -@@ -215,7 +220,8 @@ static int container_setup_volume(struct hyper_po=
d *pod,
> > +@@ -235,7 +240,8 @@ static int container_setup_volume(struct hyper_po=
d *pod,
> >                         }
> >                         if (map->docker) {
> >                                 /* converted from volume */
> > @@ -141,7 +142,7 @@ index 0938d82..b1c52d4 100644
> >                                 src =3D volume;
> >                                 if (container->initialize &&
> >                                     (container_populate_volume(mountpo=
int, volume) < 0)) {
> > -@@ -251,7 +257,7 @@ static int container_setup_modules(struct hyper_c=
ontainer *container)
> > +@@ -271,7 +277,7 @@ static int container_setup_modules(struct hyper_c=
ontainer *container)
> >   {
> >         struct stat st;
> >         struct utsname uts;
> > @@ -150,7 +151,7 @@ index 0938d82..b1c52d4 100644
> >
> >         if (uname(&uts) < 0) {
> >                 perror("fail to call uname");
> > -@@ -259,7 +265,8 @@ static int container_setup_modules(struct hyper_c=
ontainer *container)
> > +@@ -279,7 +285,8 @@ static int container_setup_modules(struct hyper_c=
ontainer *container)
> >         }
> >
> >         sprintf(src, "/lib/modules/%s", uts.release);
> > @@ -160,7 +161,7 @@ index 0938d82..b1c52d4 100644
> >
> >         if (stat(dst, &st) =3D=3D 0) {
> >                 struct dirent **list;
> > -@@ -291,7 +298,7 @@ static int container_setup_modules(struct hyper_c=
ontainer *container)
> > +@@ -318,7 +325,7 @@ static int container_setup_modules(struct hyper_c=
ontainer *container)
> >
> >   static int container_setup_mount(struct hyper_container *container)
> >   {
> > @@ -169,7 +170,7 @@ index 0938d82..b1c52d4 100644
> >
> >         // current dir is container rootfs, the operations on "./PATH"=
 are the operations on container's "/PATH"
> >         if (!container->readonly) {
> > -@@ -546,7 +553,7 @@ static int hyper_setup_container_rootfs(void *dat=
a)
> > +@@ -576,7 +583,7 @@ static int hyper_setup_container_rootfs(void *dat=
a)
> >   {
> >         struct hyper_container_arg *arg =3D data;
> >         struct hyper_container *container =3D arg->c;
> > @@ -178,7 +179,7 @@ index 0938d82..b1c52d4 100644
> >         int setup_dns;
> >
> >         /* wait for ns-opened ready message */
> > -@@ -609,7 +616,7 @@ static int hyper_setup_container_rootfs(void *dat=
a)
> > +@@ -639,7 +646,7 @@ static int hyper_setup_container_rootfs(void *dat=
a)
> >                         goto fail;
> >                 }
> >         } else {
> > @@ -187,7 +188,7 @@ index 0938d82..b1c52d4 100644
> >
> >                 sprintf(path, "%s/%s/", SHARED_DIR, container->image);
> >                 fprintf(stdout, "src directory %s\n", path);
> > -@@ -627,7 +634,9 @@ static int hyper_setup_container_rootfs(void *dat=
a)
> > +@@ -657,7 +664,9 @@ static int hyper_setup_container_rootfs(void *dat=
a)
> >         fprintf(stdout, "root directory for container is %s/%s, init t=
ask %s\n",
> >                 root, container->rootfs, container->exec.argv[0]);
> >
> > @@ -198,7 +199,7 @@ index 0938d82..b1c52d4 100644
> >         if (mount(rootfs, rootfs, NULL, MS_BIND|MS_REC, NULL) < 0) {
> >                 perror("failed to bind rootfs");
> >                 goto fail;
> > -@@ -710,7 +719,7 @@ fail:
> > +@@ -740,7 +749,7 @@ fail:
> >
> >   static int hyper_setup_pty(struct hyper_container *c)
> >   {
> > @@ -207,7 +208,7 @@ index 0938d82..b1c52d4 100644
> >
> >         sprintf(root, "/tmp/hyper/%s/devpts/", c->id);
> >
> > -@@ -730,7 +739,7 @@ static int hyper_setup_pty(struct hyper_container=
 *c)
> > +@@ -760,7 +769,7 @@ static int hyper_setup_pty(struct hyper_container=
 *c)
> >
> >   static void hyper_cleanup_pty(struct hyper_container *c)
> >   {
> > @@ -216,7 +217,7 @@ index 0938d82..b1c52d4 100644
> >
> >         sprintf(path, "/tmp/hyper/%s/devpts/", c->id);
> >         if (umount(path) < 0)
> > -@@ -739,7 +748,7 @@ static void hyper_cleanup_pty(struct hyper_contai=
ner *c)
> > +@@ -769,7 +778,7 @@ static void hyper_cleanup_pty(struct hyper_contai=
ner *c)
> >
> >   int container_prepare_rootfs_dev(struct hyper_container *container, =
struct hyper_pod *pod)
> >   {
> > @@ -225,6 +226,3 @@ index 0938d82..b1c52d4 100644
> >
> >         if (container->fstype =3D=3D NULL)
> >                 return 0;
> > ---
> > -2.17.1
> > -
> > --
> > 2.20.1
> >
> >=20

--ll6cxkvkg655aolp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXl6oQgAKCRA3VSO3ZXaA
HOsPAJ9bY0ncPtAZI2uXCL6qZ7FBi4EvhgCgo0Iz4UxN5C1/nyCJ8/hU2E8lmTg=
=jC0k
-----END PGP SIGNATURE-----

--ll6cxkvkg655aolp--
