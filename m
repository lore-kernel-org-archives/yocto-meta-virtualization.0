Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-oa0-f46.google.com (mail-oa0-f46.google.com
	[209.85.219.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A5F26E006F6
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Feb 2014 11:10:52 -0800 (PST)
Received: by mail-oa0-f46.google.com with SMTP id n16so8045190oag.33
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Feb 2014 11:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ftQYUecLSpqSCgIfM8fKvvA4C5zjkNaHQTuQ4t34xPE=;
	b=P0dlLLl+kDPTc9PsYx7v06rRdwC1sWiGWQo9fl3r/AxdhofIZ24gIDD23cLclzHbNy
	W3bcuuJJb0SpcsmqHAtZWYFb5eVWTukBt4IcreNUmWyjMKOxSGlIWLLHRpgFcvRBTSaz
	yM/VFS59kYii3yaoYSuNVxlid7y/UDZBwQN6xRr0ztys2DeC9cWJpvdSlJ0GZaEs+M9c
	1YtUO8dPQXDLDmhlHoXEo1izVjdOFlrV/eHyvaCSzDmlPl1H3QA+H+ZU1coT7ypN6mAs
	lkLHyhNbp7NRNf1Iik3gC0ev/0kpXfA24Kw6sinzOcvE+EuCMSTgud3KcX05E/q/zpEd
	NqAw==
MIME-Version: 1.0
X-Received: by 10.182.223.114 with SMTP id qt18mr2294200obc.61.1392059450946; 
	Mon, 10 Feb 2014 11:10:50 -0800 (PST)
Received: by 10.60.40.200 with HTTP; Mon, 10 Feb 2014 11:10:50 -0800 (PST)
Received: by 10.60.40.200 with HTTP; Mon, 10 Feb 2014 11:10:50 -0800 (PST)
In-Reply-To: <CADkTA4Mj0VceoZGxYFR7UN7Jx9EkGccw_Y_-OvaYDOOEp-tXKQ@mail.gmail.com>
References: <1392037746-27912-1-git-send-email-josep.puigdemont@enea.com>
	<52F8DCE4.8050404@enea.com>
	<CADkTA4Mj0VceoZGxYFR7UN7Jx9EkGccw_Y_-OvaYDOOEp-tXKQ@mail.gmail.com>
Date: Mon, 10 Feb 2014 20:10:50 +0100
Message-ID: <CAAKB1h2NREQGDbMNGN_awsYMQe0qeKzJ5SCYie0QNFmt9EKnbg@mail.gmail.com>
From: David Nystrom <david.c.nystrom@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] lxc: always strdup lxc.rootfs.mount
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
X-List-Received-Date: Mon, 10 Feb 2014 19:10:55 -0000
Content-Type: multipart/alternative; boundary=f46d044280c0147ad304f21219e6

--f46d044280c0147ad304f21219e6
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 10 Feb 2014 17:23, "Bruce Ashfield" <bruce.ashfield@gmail.com> wrote:
>
> On Mon, Feb 10, 2014 at 9:06 AM, David Nystr=F6m <david.nystrom@enea.com>
wrote:
> > On 2014-02-10 14:09, Josep Puigdemont wrote:
> >>
> >> The reason is that the generic code which handles reading
lxc.rootfs.mount
> >> always frees the old value if not NULL. So without this setting
> >> lxc.rootfs.mount =3D /mnt causes segfault.
> >>
> >> This is a backport for lxc-0.9.0 (dora) of the same fix found in
> >> upstream's master, see commits 54c30e29 and 53f3f048.
> >>
> >> Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> >> ---
> >>   .../lxc-0.9.0-always-strdup-rootfs-mount.patch     |   27
> >> ++++++++++++++++++++
> >>   recipes-containers/lxc/lxc_0.9.0.bb                |    1 +
> >>   2 files changed, 28 insertions(+)
> >>   create mode 100644
> >> recipes-containers/lxc/files/lxc-0.9.0-always-strdup-rootfs-mount.patc=
h
> >>
> >> diff --git
> >>
a/recipes-containers/lxc/files/lxc-0.9.0-always-strdup-rootfs-mount.patch
> >>
b/recipes-containers/lxc/files/lxc-0.9.0-always-strdup-rootfs-mount.patch
> >> new file mode 100644
> >> index 0000000..3e299d2
> >> --- /dev/null
> >> +++
> >>
b/recipes-containers/lxc/files/lxc-0.9.0-always-strdup-rootfs-mount.patch
> >> @@ -0,0 +1,27 @@
> >> +diff --git a/src/lxc/conf.c b/src/lxc/conf.c
> >> +index 6b3f318..2f8b9e6 100644
> >> +--- a/src/lxc/conf.c
> >> ++++ b/src/lxc/conf.c
> >> +@@ -2072,7 +2072,12 @@ struct lxc_conf *lxc_conf_init(void)
> >> +       new->console.slave =3D -1;
> >> +       new->console.name[0] =3D '\0';
> >> +       new->maincmd_fd =3D -1;
> >> +-      new->rootfs.mount =3D default_rootfs_mount;
> >> ++      new->rootfs.mount =3D strdup(default_rootfs_mount);
> >> ++      if (!new->rootfs.mount) {
> >> ++              ERROR("lxc_conf_init : %m");
> >> ++              free(new);
> >> ++              return NULL;
> >> ++      }
> >> +       new->kmsg =3D 1;
> >> +       lxc_list_init(&new->cgroup);
> >> +       lxc_list_init(&new->network);
> >> +@@ -3084,7 +3089,7 @@ void lxc_conf_free(struct lxc_conf *conf)
> >> +               return;
> >> +       if (conf->console.path)
> >> +               free(conf->console.path);
> >> +-      if (conf->rootfs.mount !=3D default_rootfs_mount)
> >> ++      if (conf->rootfs.mount)
> >> +               free(conf->rootfs.mount);
> >> +       if (conf->rootfs.path)
> >> +               free(conf->rootfs.path);
> >> diff --git a/recipes-containers/lxc/lxc_0.9.0.bb
> >> b/recipes-containers/lxc/lxc_0.9.0.bb
> >> index 8f7736b..fceefff 100644
> >> --- a/recipes-containers/lxc/lxc_0.9.0.bb
> >> +++ b/recipes-containers/lxc/lxc_0.9.0.bb
> >> @@ -26,6 +26,7 @@ SRC_URI =3D
> >> "http://linuxcontainers.org/downloads/${PN}-${PV}.tar.gz \
> >>
> >>
file://lxc-0.9.0-enable-chroot-chpasswd-functionality-for-busybox-hosts.pat=
ch
> >> \
> >>       file://lxc-0.9.0-check-when-bind-mounting-libdirs.patch \
> >>       file://lxc-0.9.0-don-t-let-LXC_PATH-end-in-failure.patch \
> >> +    file://lxc-0.9.0-always-strdup-rootfs-mount.patch \
> >>         "
> >>   SRC_URI[md5sum] =3D "8552a4479090616f4bc04d8473765fc9"
> >>   SRC_URI[sha256sum] =3D
> >> "1e1767eae6cc5fbf892c0e193d25da420ba19f2db203716c38f7cdea3b654120"
> >>
> >
> > Reviewed-by: David Nystr=F6m <david.nystrom@enea.com>
> >
> > Minor nitpicking, please add the branch name in the subject as:
> > [dora][PATCH]blah for future patches, unless its for master.
>
> Agreed. But in this case, don't we also want this on master ? The dora an=
d
> master version of lxc are the same, so doesn't this fix apply to both
branches ?

Yes, you are correct.
Misunderstanding on my behalf.

Br,
David

> Bruce
>
> >
> > Br,
> > David
> >
> >
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

--f46d044280c0147ad304f21219e6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On 10 Feb 2014 17:23, &quot;Bruce Ashfield&quot; &lt;<a href=3D"mailto:bruc=
e.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, Feb 10, 2014 at 9:06 AM, David Nystr=F6m &lt;<a href=3D"mailto=
:david.nystrom@enea.com">david.nystrom@enea.com</a>&gt; wrote:<br>
&gt; &gt; On 2014-02-10 14:09, Josep Puigdemont wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The reason is that the generic code which handles reading lxc=
.rootfs.mount<br>
&gt; &gt;&gt; always frees the old value if not NULL. So without this setti=
ng<br>
&gt; &gt;&gt; lxc.rootfs.mount =3D /mnt causes segfault.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; This is a backport for lxc-0.9.0 (dora) of the same fix found=
 in<br>
&gt; &gt;&gt; upstream&#39;s master, see commits 54c30e29 and 53f3f048.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Signed-off-by: Josep Puigdemont &lt;<a href=3D"mailto:josep.p=
uigdemont@enea.com">josep.puigdemont@enea.com</a>&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt; =A0 .../lxc-0.9.0-always-strdup-rootfs-mount.patch =A0 =A0 | =
=A0 27<br>
&gt; &gt;&gt; ++++++++++++++++++++<br>
&gt; &gt;&gt; =A0 recipes-containers/lxc/<a href=3D"http://lxc_0.9.0.bb">lx=
c_0.9.0.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A01 +<br>
&gt; &gt;&gt; =A0 2 files changed, 28 insertions(+)<br>
&gt; &gt;&gt; =A0 create mode 100644<br>
&gt; &gt;&gt; recipes-containers/lxc/files/lxc-0.9.0-always-strdup-rootfs-m=
ount.patch<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git<br>
&gt; &gt;&gt; a/recipes-containers/lxc/files/lxc-0.9.0-always-strdup-rootfs=
-mount.patch<br>
&gt; &gt;&gt; b/recipes-containers/lxc/files/lxc-0.9.0-always-strdup-rootfs=
-mount.patch<br>
&gt; &gt;&gt; new file mode 100644<br>
&gt; &gt;&gt; index 0000000..3e299d2<br>
&gt; &gt;&gt; --- /dev/null<br>
&gt; &gt;&gt; +++<br>
&gt; &gt;&gt; b/recipes-containers/lxc/files/lxc-0.9.0-always-strdup-rootfs=
-mount.patch<br>
&gt; &gt;&gt; @@ -0,0 +1,27 @@<br>
&gt; &gt;&gt; +diff --git a/src/lxc/conf.c b/src/lxc/conf.c<br>
&gt; &gt;&gt; +index 6b3f318..2f8b9e6 100644<br>
&gt; &gt;&gt; +--- a/src/lxc/conf.c<br>
&gt; &gt;&gt; ++++ b/src/lxc/conf.c<br>
&gt; &gt;&gt; +@@ -2072,7 +2072,12 @@ struct lxc_conf *lxc_conf_init(void)<=
br>
&gt; &gt;&gt; + =A0 =A0 =A0 new-&gt;console.slave =3D -1;<br>
&gt; &gt;&gt; + =A0 =A0 =A0 new-&gt;<a href=3D"http://console.name">console=
.name</a>[0] =3D &#39;\0&#39;;<br>
&gt; &gt;&gt; + =A0 =A0 =A0 new-&gt;maincmd_fd =3D -1;<br>
&gt; &gt;&gt; +- =A0 =A0 =A0new-&gt;rootfs.mount =3D default_rootfs_mount;<=
br>
&gt; &gt;&gt; ++ =A0 =A0 =A0new-&gt;rootfs.mount =3D strdup(default_rootfs_=
mount);<br>
&gt; &gt;&gt; ++ =A0 =A0 =A0if (!new-&gt;rootfs.mount) {<br>
&gt; &gt;&gt; ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ERROR(&quot;lxc_conf_init : %m&=
quot;);<br>
&gt; &gt;&gt; ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0free(new);<br>
&gt; &gt;&gt; ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0return NULL;<br>
&gt; &gt;&gt; ++ =A0 =A0 =A0}<br>
&gt; &gt;&gt; + =A0 =A0 =A0 new-&gt;kmsg =3D 1;<br>
&gt; &gt;&gt; + =A0 =A0 =A0 lxc_list_init(&amp;new-&gt;cgroup);<br>
&gt; &gt;&gt; + =A0 =A0 =A0 lxc_list_init(&amp;new-&gt;network);<br>
&gt; &gt;&gt; +@@ -3084,7 +3089,7 @@ void lxc_conf_free(struct lxc_conf *co=
nf)<br>
&gt; &gt;&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;<br>
&gt; &gt;&gt; + =A0 =A0 =A0 if (conf-&gt;console.path)<br>
&gt; &gt;&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 free(conf-&gt;console.path);<br=
>
&gt; &gt;&gt; +- =A0 =A0 =A0if (conf-&gt;rootfs.mount !=3D default_rootfs_m=
ount)<br>
&gt; &gt;&gt; ++ =A0 =A0 =A0if (conf-&gt;rootfs.mount)<br>
&gt; &gt;&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 free(conf-&gt;rootfs.mount);<br=
>
&gt; &gt;&gt; + =A0 =A0 =A0 if (conf-&gt;rootfs.path)<br>
&gt; &gt;&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 free(conf-&gt;rootfs.path);<br>
&gt; &gt;&gt; diff --git a/recipes-containers/lxc/<a href=3D"http://lxc_0.9=
.0.bb">lxc_0.9.0.bb</a><br>
&gt; &gt;&gt; b/recipes-containers/lxc/<a href=3D"http://lxc_0.9.0.bb">lxc_=
0.9.0.bb</a><br>
&gt; &gt;&gt; index 8f7736b..fceefff 100644<br>
&gt; &gt;&gt; --- a/recipes-containers/lxc/<a href=3D"http://lxc_0.9.0.bb">=
lxc_0.9.0.bb</a><br>
&gt; &gt;&gt; +++ b/recipes-containers/lxc/<a href=3D"http://lxc_0.9.0.bb">=
lxc_0.9.0.bb</a><br>
&gt; &gt;&gt; @@ -26,6 +26,7 @@ SRC_URI =3D<br>
&gt; &gt;&gt; &quot;<a href=3D"http://linuxcontainers.org/downloads/${PN}-$=
{PV}.tar.gz">http://linuxcontainers.org/downloads/${PN}-${PV}.tar.gz</a> \<=
br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; file://lxc-0.9.0-enable-chroot-chpasswd-functionality-for-bus=
ybox-hosts.patch<br>
&gt; &gt;&gt; \<br>
&gt; &gt;&gt; =A0 =A0 =A0 file://lxc-0.9.0-check-when-bind-mounting-libdirs=
.patch \<br>
&gt; &gt;&gt; =A0 =A0 =A0 file://lxc-0.9.0-don-t-let-LXC_PATH-end-in-failur=
e.patch \<br>
&gt; &gt;&gt; + =A0 =A0file://lxc-0.9.0-always-strdup-rootfs-mount.patch \<=
br>
&gt; &gt;&gt; =A0 =A0 =A0 =A0 &quot;<br>
&gt; &gt;&gt; =A0 SRC_URI[md5sum] =3D &quot;8552a4479090616f4bc04d8473765fc=
9&quot;<br>
&gt; &gt;&gt; =A0 SRC_URI[sha256sum] =3D<br>
&gt; &gt;&gt; &quot;1e1767eae6cc5fbf892c0e193d25da420ba19f2db203716c38f7cde=
a3b654120&quot;<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; Reviewed-by: David Nystr=F6m &lt;<a href=3D"mailto:david.nystrom@=
enea.com">david.nystrom@enea.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Minor nitpicking, please add the branch name in the subject as:<b=
r>
&gt; &gt; [dora][PATCH]blah for future patches, unless its for master.<br>
&gt;<br>
&gt; Agreed. But in this case, don&#39;t we also want this on master ? The =
dora and<br>
&gt; master version of lxc are the same, so doesn&#39;t this fix apply to b=
oth branches ?</p>
<p dir=3D"ltr">Yes, you are correct.<br>
Misunderstanding on my behalf.</p>
<p dir=3D"ltr">Br,<br>
David</p>
<p dir=3D"ltr">&gt; Bruce<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Br,<br>
&gt; &gt; David<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; meta-virtualization mailing list<br>
&gt; &gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virt=
ualization@yoctoproject.org</a><br>
&gt; &gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualiz=
ation">https://lists.yoctoproject.org/listinfo/meta-virtualization</a><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; &quot;Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait<br>
&gt; thee at its end&quot;<br>
&gt; _______________________________________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualiz=
ation@yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
">https://lists.yoctoproject.org/listinfo/meta-virtualization</a><br>
</p>

--f46d044280c0147ad304f21219e6--
