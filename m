Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EEF96E006B3; Mon, 20 Jun 2016 05:10:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AB091E00474
	for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Jun 2016 05:10:17 -0700 (PDT)
Received: by mail-qk0-f193.google.com with SMTP id l81so23143393qke.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Jun 2016 05:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xM0KYWMSjOJX8vGWzHfXTCfwvhRxOqmQ/ZUtB8PcL7s=;
	b=OCalZtm/41Zx0OgzgMTRyyTLboLlQNZ2R+s+rnHgk+rirz1jL3i9V3vUx84XYe3KO9
	oP0Guu2S/MrknEkLPs1IbiywFJIbAPU5FDvLSX6lZV7t8IAItJPkCM2XFNkvLV8EqkYB
	Hbr+fF9S4WdrdGz5dBT7RyRp0Arq1YSK0JNW9uX9AzK5pCi8r40jUSZUsYvT86csyzLJ
	8QiWEFvCFqp9fkknFCNwV7vmblpAD0Bpvh8i0vWHr6ikdcYZJC+A/kYzJdwUf42zICQ/
	9YaSRrSNZ8ljwIwSxxyqEsl0BKNbBJ/T1HfDIKoku2kF9AQfa8stgmaDw3Mg6q8HFU4g
	KWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xM0KYWMSjOJX8vGWzHfXTCfwvhRxOqmQ/ZUtB8PcL7s=;
	b=L2w4i4fZly6/N+qn5Qf1DS1x6BJpMof2Wga95Dm4p2H/vTE+bVBg8IfPRJTi53jzml
	R9Xb8bYitV8YV2Q3etvHc2q4La5pGOBZrSQZqj0ccfCor6+WXlxDXQ3vw2scMO6J7nG5
	O2QYQX2bqN+PYYR4XHSXjy/jRdRg+t13DGgKZFg+QUE5E3XmnTT6K+4Q8fNG4GvMehGp
	OgiASRPzJ2wbLyWhc3k/xtHP2UiNAsay/5tSxWxGlDeMXEGaSQfBYiak/WXqFXQAAB7N
	7KGSn16edv7V6Pi5HldbkzQ74R+dUFPx+sdKfeIxAdd7//5Y4rDE/LuE9rx9A/o8ANKz
	6Yzw==
X-Gm-Message-State: ALyK8tKMfIG+72iar9zqGOknRRh++W5Rbc7GfKYXmnhOu0I7rGXUtcXZ+dPpL42iXwP9PCNjs6ciD45pm41w4A==
X-Received: by 10.233.223.5 with SMTP id t5mr20088174qkf.35.1466424617197;
	Mon, 20 Jun 2016 05:10:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.52.184 with HTTP; Mon, 20 Jun 2016 05:10:16 -0700 (PDT)
In-Reply-To: <1466326126-21949-1-git-send-email-paul@paulbarker.me.uk>
References: <1466326126-21949-1-git-send-email-paul@paulbarker.me.uk>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 20 Jun 2016 08:10:16 -0400
Message-ID: <CADkTA4O=_N47swa_-oDjdaEZrkp9Uj6M9BsSYN1UP=OvMeKDSQ@mail.gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] netns: New recipe
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
X-List-Received-Date: Mon, 20 Jun 2016 12:10:25 -0000
Content-Type: multipart/alternative; boundary=94eb2c04394865e3bc0535b4966f

--94eb2c04394865e3bc0535b4966f
Content-Type: text/plain; charset=UTF-8

On Sun, Jun 19, 2016 at 4:48 AM, Paul Barker <paul@paulbarker.me.uk> wrote:

> netns is a runc hook for setting up simple bridge networking within
> containers.
>
> See README.md (or https://github.com/jfrazelle/netns/blob/master/README.md)
> for
> instructions on how to use netns.
>

I've been using the same thing here for my simple configs.

I'll queue this and ensure it is a drop in replacement.

Bruce


>
> Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> ---
>  recipes-networking/netns/netns_git.bb | 44
> +++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 recipes-networking/netns/netns_git.bb
>
> diff --git a/recipes-networking/netns/netns_git.bb
> b/recipes-networking/netns/netns_git.bb
> new file mode 100644
> index 0000000..073022e
> --- /dev/null
> +++ b/recipes-networking/netns/netns_git.bb
> @@ -0,0 +1,44 @@
> +HOMEPAGE = "https://github.com/jfrazelle/netns"
> +SUMMARY = "Runc hook for setting up default bridge networking."
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=20ce4c6a4f32d6ee4a68e3a7506db3f1"
> +DEPENDS = "go-cross"
> +
> +SRC_URI = "git://github.com/jfrazelle/netns;branch=master"
> +SRCREV = "2804050eeab661bfa75c3aa06bdcf60273b02ca7"
> +PV = "0.1.0+git${SRCPV}"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit go-osarchmap
> +
> +do_compile() {
> +       export GOARCH="${TARGET_GOARCH}"
> +
> +       # Setup vendor directory so that it can be used in GOPATH.
> +       #
> +       # Go looks in a src directory under any directory in GOPATH but
> netns
> +       # uses 'vendor' instead of 'vendor/src'. We can fix this with a
> symlink.
> +       #
> +       # We also need to link in the ipallocator directory as that is not
> under
> +       # a src directory.
> +       ln -sfn . "${S}/vendor/src"
> +       mkdir -p "${S}/vendor/src/github.com/jfrazelle/netns"
> +       ln -sfn "${S}/ipallocator" "${S}/vendor/src/
> github.com/jfrazelle/netns/ipallocator"
> +       export GOPATH="${S}/vendor"
> +
> +       # Pass the needed cflags/ldflags so that cgo
> +       # can find the needed headers files and libraries
> +       export CGO_ENABLED="1"
> +       export CFLAGS=""
> +       export LDFLAGS=""
> +       export CGO_CFLAGS="${BUILDSDK_CFLAGS}
> --sysroot=${STAGING_DIR_TARGET}"
> +       export CGO_LDFLAGS="${BUILDSDK_LDFLAGS}
> --sysroot=${STAGING_DIR_TARGET}"
> +
> +       oe_runmake static
> +}
> +
> +do_install() {
> +       install -d ${D}/${sbindir}
> +       install ${S}/netns ${D}/${sbindir}/netns
> +}
> --
> 2.1.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c04394865e3bc0535b4966f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sun, Jun 19, 2016 at 4:48 AM, Paul Barker <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:paul@paulbarker.me.uk" target=3D"_blank">paul@paulbarker.me.u=
k</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">netns is a runc h=
ook for setting up simple bridge networking within containers.<br>
<br>
See README.md (or <a href=3D"https://github.com/jfrazelle/netns/blob/master=
/README.md" rel=3D"noreferrer" target=3D"_blank">https://github.com/jfrazel=
le/netns/blob/master/README.md</a>) for<br>
instructions on how to use netns.<br></blockquote><div><br></div><div>I&#39=
;ve been using the same thing here for my simple configs.</div><div><br></d=
iv><div>I&#39;ll queue this and ensure it is a drop in replacement.</div><d=
iv><br></div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">
<br>
Signed-off-by: Paul Barker &lt;<a href=3D"mailto:paul@paulbarker.me.uk">pau=
l@paulbarker.me.uk</a>&gt;<br>
---<br>
=C2=A0recipes-networking/netns/<a href=3D"http://netns_git.bb" rel=3D"noref=
errer" target=3D"_blank">netns_git.bb</a> | 44 ++++++++++++++++++++++++++++=
+++++++<br>
=C2=A01 file changed, 44 insertions(+)<br>
=C2=A0create mode 100644 recipes-networking/netns/<a href=3D"http://netns_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">netns_git.bb</a><br>
<br>
diff --git a/recipes-networking/netns/<a href=3D"http://netns_git.bb" rel=
=3D"noreferrer" target=3D"_blank">netns_git.bb</a> b/recipes-networking/net=
ns/<a href=3D"http://netns_git.bb" rel=3D"noreferrer" target=3D"_blank">net=
ns_git.bb</a><br>
new file mode 100644<br>
index 0000000..073022e<br>
--- /dev/null<br>
+++ b/recipes-networking/netns/<a href=3D"http://netns_git.bb" rel=3D"noref=
errer" target=3D"_blank">netns_git.bb</a><br>
@@ -0,0 +1,44 @@<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/jfrazelle/netns" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/jfrazelle/netns</a>&quot;<b=
r>
+SUMMARY =3D &quot;Runc hook for setting up default bridge networking.&quot=
;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D20ce4c6a4f32d6ee4a68e3a750=
6db3f1&quot;<br>
+DEPENDS =3D &quot;go-cross&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/jfrazelle/netns;branc=
h=3Dmaster" rel=3D"noreferrer" target=3D"_blank">github.com/jfrazelle/netns=
;branch=3Dmaster</a>&quot;<br>
+SRCREV =3D &quot;2804050eeab661bfa75c3aa06bdcf60273b02ca7&quot;<br>
+PV =3D &quot;0.1.0+git${SRCPV}&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit go-osarchmap<br>
+<br>
+do_compile() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOARCH=3D&quot;${TARGET_GOARCH}&quot;<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Setup vendor directory so that it can be used=
 in GOPATH.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0#<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Go looks in a src directory under any directo=
ry in GOPATH but netns<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# uses &#39;vendor&#39; instead of &#39;vendor/=
src&#39;. We can fix this with a symlink.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0#<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# We also need to link in the ipallocator direc=
tory as that is not under<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# a src directory.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sfn . &quot;${S}/vendor/src&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p &quot;${S}/vendor/src/<a href=3D"http:=
//github.com/jfrazelle/netns" rel=3D"noreferrer" target=3D"_blank">github.c=
om/jfrazelle/netns</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sfn &quot;${S}/ipallocator&quot; &quot;${S}=
/vendor/src/<a href=3D"http://github.com/jfrazelle/netns/ipallocator" rel=
=3D"noreferrer" target=3D"_blank">github.com/jfrazelle/netns/ipallocator</a=
>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOPATH=3D&quot;${S}/vendor&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Pass the needed cflags/ldflags so that cgo<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# can find the needed headers files and librari=
es<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D&quot;1&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export CFLAGS=3D&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export LDFLAGS=3D&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_CFLAGS=3D&quot;${BUILDSDK_CFLAGS} --=
sysroot=3D${STAGING_DIR_TARGET}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D&quot;${BUILDSDK_LDFLAGS} =
--sysroot=3D${STAGING_DIR_TARGET}&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake static<br>
+}<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}/${sbindir}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install ${S}/netns ${D}/${sbindir}/netns<br>
+}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--94eb2c04394865e3bc0535b4966f--
