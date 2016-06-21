Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ED297E0083D; Tue, 21 Jun 2016 06:40:59 -0700 (PDT)
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
	*      [209.85.220.169 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 20B1CE00708
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Jun 2016 06:40:57 -0700 (PDT)
Received: by mail-qk0-f169.google.com with SMTP id c73so20780732qkg.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Jun 2016 06:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NQGovwMwO05uTW/7ssqnS+KBTqy4RjMPVQZhOzia9ic=;
	b=WmlHat9crWOltIYP+J/rnevcLJO5PwEATYG437EFZqncbkXcAFZscBHF9dUBGf+UVY
	JJAGYFTBn3YpBXG2mHYWy9VWt9eQUCSfChXyqPWe/DIpaKiLUCH/gPVoGuaglNXtK4av
	4iGU3tWK07ZbSFkvJ+7D1e2SYuixQBhI+4vAGfUp/IX1y6+tA3Zl2risZ+E0gOAr+rgR
	Khb0W9D4iJLiP/EATJH7dZ6JUivJYoeP2paLUQZSiP/QIJ5Z8nCEiQ8pvqasdbycRqZZ
	8FY7ULTw7k/tBYxkQF5L/22ca4X/kRnA5ZwVCJtfWuDgvMtbx3kZ2/YEDJ9Ta7QK1B6L
	AKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NQGovwMwO05uTW/7ssqnS+KBTqy4RjMPVQZhOzia9ic=;
	b=Vel2k3EQDlRW+T0+r/WU3xDiNSRwsz/vk/uSAZJ/O5AcQodntKJ3dc9J4RRt1RT0Vw
	jCyMddERYtMQy+NgDTaHILt3WilYvX9Z1nAUrIPkvE2/YZE3OYDrxB5OPP7GWsKZhtap
	Z4rZV2EwPYX2R3cAqEXoG4/U51mGn2sD+xufYLaivcffH+utLTd4HfiwxBOP02XcjIWS
	QzmSYHOiw4mjC2beY1RioKqaVPpxEO7558ufy8V+oucXdDQpOE9iHD6ae57C8NUmyQqo
	7DnsVUmBVRVJ+b8K+2U4xsLo65zgfo3Qopk6RopLJKqK1zziBd6Eqy3aaZSrsS+y+hLo
	TlPA==
X-Gm-Message-State: ALyK8tL3mtcjYSSxzp772j8MFLfRG/huG4b+5GJAbo17K9aT1Bw3tEcG5jjg6QAXaQ4I3p+T7vDdERHdOjJRYQ==
X-Received: by 10.55.198.196 with SMTP id s65mr28473493qkl.119.1466516457182; 
	Tue, 21 Jun 2016 06:40:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.52.184 with HTTP; Tue, 21 Jun 2016 06:40:56 -0700 (PDT)
In-Reply-To: <CADkTA4O=_N47swa_-oDjdaEZrkp9Uj6M9BsSYN1UP=OvMeKDSQ@mail.gmail.com>
References: <1466326126-21949-1-git-send-email-paul@paulbarker.me.uk>
	<CADkTA4O=_N47swa_-oDjdaEZrkp9Uj6M9BsSYN1UP=OvMeKDSQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 21 Jun 2016 09:40:56 -0400
Message-ID: <CADkTA4N+4wcAcZUJCsC9QDK+g1=HKQa9DK1rxngyUwVZ0b+CqQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 21 Jun 2016 13:41:00 -0000
Content-Type: multipart/alternative; boundary=001a113f3f787cde720535c9f820

--001a113f3f787cde720535c9f820
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 20, 2016 at 8:10 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Sun, Jun 19, 2016 at 4:48 AM, Paul Barker <paul@paulbarker.me.uk>
> wrote:
>
>> netns is a runc hook for setting up simple bridge networking within
>> containers.
>>
>> See README.md (or
>> https://github.com/jfrazelle/netns/blob/master/README.md) for
>> instructions on how to use netns.
>>
>
> I've been using the same thing here for my simple configs.
>
> I'll queue this and ensure it is a drop in replacement.
>

This worked like my variant did, so I've now pushed this to master.

Bruce


>
> Bruce
>
>
>>
>> Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
>> ---
>>  recipes-networking/netns/netns_git.bb | 44
>> +++++++++++++++++++++++++++++++++++
>>  1 file changed, 44 insertions(+)
>>  create mode 100644 recipes-networking/netns/netns_git.bb
>>
>> diff --git a/recipes-networking/netns/netns_git.bb
>> b/recipes-networking/netns/netns_git.bb
>> new file mode 100644
>> index 0000000..073022e
>> --- /dev/null
>> +++ b/recipes-networking/netns/netns_git.bb
>> @@ -0,0 +1,44 @@
>> +HOMEPAGE = "https://github.com/jfrazelle/netns"
>> +SUMMARY = "Runc hook for setting up default bridge networking."
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=20ce4c6a4f32d6ee4a68e3a7506db3f1"
>> +DEPENDS = "go-cross"
>> +
>> +SRC_URI = "git://github.com/jfrazelle/netns;branch=master"
>> +SRCREV = "2804050eeab661bfa75c3aa06bdcf60273b02ca7"
>> +PV = "0.1.0+git${SRCPV}"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +inherit go-osarchmap
>> +
>> +do_compile() {
>> +       export GOARCH="${TARGET_GOARCH}"
>> +
>> +       # Setup vendor directory so that it can be used in GOPATH.
>> +       #
>> +       # Go looks in a src directory under any directory in GOPATH but
>> netns
>> +       # uses 'vendor' instead of 'vendor/src'. We can fix this with a
>> symlink.
>> +       #
>> +       # We also need to link in the ipallocator directory as that is
>> not under
>> +       # a src directory.
>> +       ln -sfn . "${S}/vendor/src"
>> +       mkdir -p "${S}/vendor/src/github.com/jfrazelle/netns"
>> +       ln -sfn "${S}/ipallocator" "${S}/vendor/src/
>> github.com/jfrazelle/netns/ipallocator"
>> +       export GOPATH="${S}/vendor"
>> +
>> +       # Pass the needed cflags/ldflags so that cgo
>> +       # can find the needed headers files and libraries
>> +       export CGO_ENABLED="1"
>> +       export CFLAGS=""
>> +       export LDFLAGS=""
>> +       export CGO_CFLAGS="${BUILDSDK_CFLAGS}
>> --sysroot=${STAGING_DIR_TARGET}"
>> +       export CGO_LDFLAGS="${BUILDSDK_LDFLAGS}
>> --sysroot=${STAGING_DIR_TARGET}"
>> +
>> +       oe_runmake static
>> +}
>> +
>> +do_install() {
>> +       install -d ${D}/${sbindir}
>> +       install ${S}/netns ${D}/${sbindir}/netns
>> +}
>> --
>> 2.1.4
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113f3f787cde720535c9f820
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Jun 20, 2016 at 8:10 AM, Bruce Ashfield <span dir=3D"ltr">&lt;<=
a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield=
@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><spa=
n class=3D"">On Sun, Jun 19, 2016 at 4:48 AM, Paul Barker <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:paul@paulbarker.me.uk" target=3D"_blank">paul@paulba=
rker.me.uk</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">netns is=
 a runc hook for setting up simple bridge networking within containers.<br>
<br>
See README.md (or <a href=3D"https://github.com/jfrazelle/netns/blob/master=
/README.md" rel=3D"noreferrer" target=3D"_blank">https://github.com/jfrazel=
le/netns/blob/master/README.md</a>) for<br>
instructions on how to use netns.<br></blockquote><div><br></div></span><di=
v>I&#39;ve been using the same thing here for my simple configs.</div><div>=
<br></div><div>I&#39;ll queue this and ensure it is a drop in replacement.<=
/div></div></div></div></blockquote><div><br></div><div>This worked like my=
 variant did, so I&#39;ve now pushed this to master.</div><div><br></div><d=
iv>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"l=
tr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div><br></div><d=
iv>Bruce</div><div><div class=3D"h5"><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">
<br>
Signed-off-by: Paul Barker &lt;<a href=3D"mailto:paul@paulbarker.me.uk" tar=
get=3D"_blank">paul@paulbarker.me.uk</a>&gt;<br>
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
<span><font color=3D"#888888">--<br>
2.1.4<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div></div></div><span class=3D"HOEnZb"><font c=
olor=3D"#888888"><br><br clear=3D"all"><div><br></div>-- <br><div data-smar=
tmail=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for=
 chaos and madness await thee at its end&quot;</div>
</font></span></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--001a113f3f787cde720535c9f820--
