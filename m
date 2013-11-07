Return-Path: <cjp256@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57AFBE017F8
	for <meta-virtualization@yoctoproject.org>;
	Wed,  6 Nov 2013 19:20:07 -0800 (PST)
Received: by mail-la0-f42.google.com with SMTP id ep20so307116lab.15
	for <meta-virtualization@yoctoproject.org>;
	Wed, 06 Nov 2013 19:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ftjiZim4ajUxIvH2fZuqV/64NfeHgXXr8Fph4Jwuy+w=;
	b=Rp4B7zm7Jia0IOSk9P1d3gNz/g36rgvr+nwmk7RCWNH5S5TfsPguXle8Y3oIKEnV+r
	dYxpQ4mbmlwEqGJ1GcAqV9LUlftgvGm5O4bqR2L9Kzq1IUIg5xxjKHblluNcTAPoYNMD
	4KWh+5zaSmPpyGLAKM87qQEhysrOJQ1htoU/hyvvnsTiTvq0lfLb8TxoiPT0JI4NriM+
	Zsqpw+zMiLlFmJvSNVyUOUq2coN+VmdLwrY+Kvl/dIcKYpCfsZrWIJZ9iaaXqwytoRaL
	hp16i7aleuoiuRxvYQ4/sJeDawd9fKKjfRwatZKFWa8N6fSFJ/lAUD8oEJ59IIAaJVpR
	LGAQ==
MIME-Version: 1.0
X-Received: by 10.152.225.161 with SMTP id rl1mr37327lac.38.1383794406056;
	Wed, 06 Nov 2013 19:20:06 -0800 (PST)
Received: by 10.114.181.41 with HTTP; Wed, 6 Nov 2013 19:20:05 -0800 (PST)
In-Reply-To: <527A4093.2010806@twobit.us>
References: <1383704237-3496-1-git-send-email-flihp@twobit.us>
	<CABZSBQcqShF0d4AOy3pxi3uc_d=NchGw7LiEYZS5HmgUoSL4Rw@mail.gmail.com>
	<527A4093.2010806@twobit.us>
Date: Wed, 6 Nov 2013 22:20:05 -0500
Message-ID: <CABZSBQcNSutTrkVNs6f9HWb+Eb8AR7cX7tAZkBX=j1MtfH7Vmw@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Philip Tricca <flihp@twobit.us>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2] xen: use PACKAGECONFIG for SDL and a bit of dependency cleanup
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
X-List-Received-Date: Thu, 07 Nov 2013 03:20:08 -0000
Content-Type: multipart/alternative; boundary=001a113490fa03e78804ea8dbe1b

--001a113490fa03e78804ea8dbe1b
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 6, 2013 at 8:13 AM, Philip Tricca <flihp@twobit.us> wrote:

> On 11/05/2013 09:36 PM, Chris Patterson wrote:
> > FYI - removing libgl as a dependency exposes another hardcoded
> > dependency/check/path (in this case adding /usr/include/GL to the
> > include path for qemu-xen-traditional).  Probably won't hit it unless
> > you have the opengl or libsdl dev bits on your host (as I do).
> >
> > WARNING: QA Issue: xen: The compile log indicates that host include
> > and/or library paths were used.
> > ...
> >   CC    audio/sdlaudio.o
> > cc1: warning: include location "/usr/include/GL" is unsafe for
> > cross-compilation [-Wpoison-system-directories]
> > ....
>
> Yuck. I'm seeing this in the qemu-xen-traditional configure script. It's
> a separate issue from this patch though no?
>
>
Yeah, I though the removal of libgl triggered it, but I guess not. I'm
looking at some of the trouble points, seeing what could be cleaned up for
future revs.

Cheers,
-Chris


> - Philip
>
> > On Tue, Nov 5, 2013 at 9:17 PM, Philip Tricca <flihp@twobit.us
> > <mailto:flihp@twobit.us>> wrote:
> >
> >     This patch moves the optional SDL dependency to a PACKAGECONFIG
> >     entry. It also cleans up dependencies on both the virtual libsdl
> >     and libsdl. The dependency on libgl is also removed. libGL support
> >     should be enabled with the 'opengl' distro feature instead. The
> >     dependency on glib-2.0 is now explicit as well.
> >
> >     Signed-off-by: Philip Tricca <flihp@twobit.us <mailto:
> flihp@twobit.us>>
> >     ---
> >      recipes-extended/xen/xen_4.3.0.bb <http://xen_4.3.0.bb> |    6
> ++++--
> >      1 file changed, 4 insertions(+), 2 deletions(-)
> >
> >     diff --git a/recipes-extended/xen/xen_4.3.0.bb <http://xen_4.3.0.bb>
> >     b/recipes-extended/xen/xen_4.3.0.bb <http://xen_4.3.0.bb>
> >     index 09c25aa..283da28 100644
> >     --- a/recipes-extended/xen/xen_4.3.0.bb <http://xen_4.3.0.bb>
> >     +++ b/recipes-extended/xen/xen_4.3.0.bb <http://xen_4.3.0.bb>
> >     @@ -21,17 +21,19 @@ COMPATIBLE_HOST = '(x86_64.*).*-linux'
> >      inherit autotools gettext setuptools update-rc.d
> >
> >      PACKAGECONFIG ??= " \
> >     +    sdl \
> >          xsm \
> >      "
> >     +PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl,"
> >      PACKAGECONFIG[xsm] =
> >     "--enable-xsmpolicy,--disable-xsmpolicy,checkpolicy-native,"
> >
> >     -DEPENDS = "util-linux util-linux-native file-native zlib ncurses
> >     openssl bison-native flex-native gettext dev86-native iasl-native
> >     pciutils virtual/libgl virtual/libsdl bridge-utils iproute2 procps
> >     yajl pixman python python-setuptools-native xz xz-native libsdl"
> >     +DEPENDS = "util-linux util-linux-native file-native zlib ncurses
> >     openssl bison-native flex-native gettext dev86-native iasl-native
> >     pciutils bridge-utils iproute2 procps yajl pixman python
> >     python-setuptools-native xz xz-native glib-2.0"
> >
> >      # inherit setuptools adds python to RDEPENDS, override it
> >      RDEPENDS_${PN} = ""
> >
> >      RDEPENDS_${PN}-base = "\
> >     -    libgcc libsdl udev bash perl xz \
> >     +    libgcc udev bash perl xz \
> >          ${PN}-blktap \
> >          ${PN}-console \
> >          ${PN}-libblktapctl \
> >     --
> >     1.7.10.4
> >
> >     _______________________________________________
> >     meta-virtualization mailing list
> >     meta-virtualization@yoctoproject.org
> >     <mailto:meta-virtualization@yoctoproject.org>
> >     https://lists.yoctoproject.org/listinfo/meta-virtualization
> >
> >
>
>

--001a113490fa03e78804ea8dbe1b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quo=
te">On Wed, Nov 6, 2013 at 8:13 AM, Philip Tricca <span dir=3D"ltr">&lt;<a =
href=3D"mailto:flihp@twobit.us" target=3D"_blank">flihp@twobit.us</a>&gt;</=
span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div>On 11/05/2013 09:36 PM, Chris Patterson=
 wrote:<br>
&gt; FYI - removing libgl as a dependency exposes another hardcoded<br>
&gt; dependency/check/path (in this case adding /usr/include/GL to the<br>
&gt; include path for qemu-xen-traditional). =A0Probably won&#39;t hit it u=
nless<br>
&gt; you have the opengl or libsdl dev bits on your host (as I do).<br>
&gt;<br>
&gt; WARNING: QA Issue: xen: The compile log indicates that host include<br=
>
&gt; and/or library paths were used.<br>
&gt; ...<br>
&gt; =A0 CC =A0 =A0audio/sdlaudio.o<br>
&gt; cc1: warning: include location &quot;/usr/include/GL&quot; is unsafe f=
or<br>
&gt; cross-compilation [-Wpoison-system-directories]<br>
&gt; ....<br>
<br>
</div>Yuck. I&#39;m seeing this in the qemu-xen-traditional configure scrip=
t. It&#39;s<br>
a separate issue from this patch though no?<br>
<br></blockquote><div><br></div><div>Yeah, I though the removal of libgl tr=
iggered it, but I guess not. I&#39;m looking at some of the trouble points,=
 seeing what could be cleaned up for future revs.<br><br></div><div>Cheers,=
<br>
</div><div>-Chris<br>
</div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
- Philip<br>
<div><br>
&gt; On Tue, Nov 5, 2013 at 9:17 PM, Philip Tricca &lt;<a href=3D"mailto:fl=
ihp@twobit.us" target=3D"_blank">flihp@twobit.us</a><br>
</div><div>&gt; &lt;mailto:<a href=3D"mailto:flihp@twobit.us" target=3D"_bl=
ank">flihp@twobit.us</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt; =A0 =A0 This patch moves the optional SDL dependency to a PACKAGECONFI=
G<br>
&gt; =A0 =A0 entry. It also cleans up dependencies on both the virtual libs=
dl<br>
&gt; =A0 =A0 and libsdl. The dependency on libgl is also removed. libGL sup=
port<br>
&gt; =A0 =A0 should be enabled with the &#39;opengl&#39; distro feature ins=
tead. The<br>
&gt; =A0 =A0 dependency on glib-2.0 is now explicit as well.<br>
&gt;<br>
</div>&gt; =A0 =A0 Signed-off-by: Philip Tricca &lt;<a href=3D"mailto:flihp=
@twobit.us" target=3D"_blank">flihp@twobit.us</a> &lt;mailto:<a href=3D"mai=
lto:flihp@twobit.us" target=3D"_blank">flihp@twobit.us</a>&gt;&gt;<br>
&gt; =A0 =A0 ---<br>
&gt; =A0 =A0 =A0recipes-extended/xen/<a href=3D"http://xen_4.3.0.bb" target=
=3D"_blank">xen_4.3.0.bb</a> &lt;<a href=3D"http://xen_4.3.0.bb" target=3D"=
_blank">http://xen_4.3.0.bb</a>&gt; | =A0 =A06 ++++--<br>
<div>&gt; =A0 =A0 =A01 file changed, 4 insertions(+), 2 deletions(-)<br>
&gt;<br>
</div>&gt; =A0 =A0 diff --git a/recipes-extended/xen/<a href=3D"http://xen_=
4.3.0.bb" target=3D"_blank">xen_4.3.0.bb</a> &lt;<a href=3D"http://xen_4.3.=
0.bb" target=3D"_blank">http://xen_4.3.0.bb</a>&gt;<br>
&gt; =A0 =A0 b/recipes-extended/xen/<a href=3D"http://xen_4.3.0.bb" target=
=3D"_blank">xen_4.3.0.bb</a> &lt;<a href=3D"http://xen_4.3.0.bb" target=3D"=
_blank">http://xen_4.3.0.bb</a>&gt;<br>
&gt; =A0 =A0 index 09c25aa..283da28 100644<br>
&gt; =A0 =A0 --- a/recipes-extended/xen/<a href=3D"http://xen_4.3.0.bb" tar=
get=3D"_blank">xen_4.3.0.bb</a> &lt;<a href=3D"http://xen_4.3.0.bb" target=
=3D"_blank">http://xen_4.3.0.bb</a>&gt;<br>
&gt; =A0 =A0 +++ b/recipes-extended/xen/<a href=3D"http://xen_4.3.0.bb" tar=
get=3D"_blank">xen_4.3.0.bb</a> &lt;<a href=3D"http://xen_4.3.0.bb" target=
=3D"_blank">http://xen_4.3.0.bb</a>&gt;<br>
<div><div>&gt; =A0 =A0 @@ -21,17 +21,19 @@ COMPATIBLE_HOST =3D &#39;(x86_64=
.*).*-linux&#39;<br>
&gt; =A0 =A0 =A0inherit autotools gettext setuptools update-rc.d<br>
&gt;<br>
&gt; =A0 =A0 =A0PACKAGECONFIG ??=3D &quot; \<br>
&gt; =A0 =A0 + =A0 =A0sdl \<br>
&gt; =A0 =A0 =A0 =A0 =A0xsm \<br>
&gt; =A0 =A0 =A0&quot;<br>
&gt; =A0 =A0 +PACKAGECONFIG[sdl] =3D &quot;--enable-sdl,--disable-sdl,virtu=
al/libsdl,&quot;<br>
&gt; =A0 =A0 =A0PACKAGECONFIG[xsm] =3D<br>
&gt; =A0 =A0 &quot;--enable-xsmpolicy,--disable-xsmpolicy,checkpolicy-nativ=
e,&quot;<br>
&gt;<br>
&gt; =A0 =A0 -DEPENDS =3D &quot;util-linux util-linux-native file-native zl=
ib ncurses<br>
&gt; =A0 =A0 openssl bison-native flex-native gettext dev86-native iasl-nat=
ive<br>
&gt; =A0 =A0 pciutils virtual/libgl virtual/libsdl bridge-utils iproute2 pr=
ocps<br>
&gt; =A0 =A0 yajl pixman python python-setuptools-native xz xz-native libsd=
l&quot;<br>
&gt; =A0 =A0 +DEPENDS =3D &quot;util-linux util-linux-native file-native zl=
ib ncurses<br>
&gt; =A0 =A0 openssl bison-native flex-native gettext dev86-native iasl-nat=
ive<br>
&gt; =A0 =A0 pciutils bridge-utils iproute2 procps yajl pixman python<br>
&gt; =A0 =A0 python-setuptools-native xz xz-native glib-2.0&quot;<br>
&gt;<br>
&gt; =A0 =A0 =A0# inherit setuptools adds python to RDEPENDS, override it<b=
r>
&gt; =A0 =A0 =A0RDEPENDS_${PN} =3D &quot;&quot;<br>
&gt;<br>
&gt; =A0 =A0 =A0RDEPENDS_${PN}-base =3D &quot;\<br>
&gt; =A0 =A0 - =A0 =A0libgcc libsdl udev bash perl xz \<br>
&gt; =A0 =A0 + =A0 =A0libgcc udev bash perl xz \<br>
&gt; =A0 =A0 =A0 =A0 =A0${PN}-blktap \<br>
&gt; =A0 =A0 =A0 =A0 =A0${PN}-console \<br>
&gt; =A0 =A0 =A0 =A0 =A0${PN}-libblktapctl \<br>
&gt; =A0 =A0 --<br>
&gt; =A0 =A0 1.7.10.4<br>
&gt;<br>
&gt; =A0 =A0 _______________________________________________<br>
&gt; =A0 =A0 meta-virtualization mailing list<br>
&gt; =A0 =A0 <a href=3D"mailto:meta-virtualization@yoctoproject.org" target=
=3D"_blank">meta-virtualization@yoctoproject.org</a><br>
</div></div>&gt; =A0 =A0 &lt;mailto:<a href=3D"mailto:meta-virtualization@y=
octoproject.org" target=3D"_blank">meta-virtualization@yoctoproject.org</a>=
&gt;<br>
&gt; =A0 =A0 <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtua=
lization" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-vi=
rtualization</a><br>
&gt;<br>
&gt;<br>
<br>
</blockquote></div><br></div></div>

--001a113490fa03e78804ea8dbe1b--
