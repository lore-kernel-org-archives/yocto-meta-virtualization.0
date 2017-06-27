Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 20B3DE00B2F; Tue, 27 Jun 2017 10:26:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_05_10, 
	RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.52 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.52 listed in dnsbl.sorbs.net]
	* 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML obfuscation
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 90F28E00B2F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Jun 2017 10:26:29 -0700 (PDT)
Received: by mail-lf0-f52.google.com with SMTP id m77so21240320lfe.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Jun 2017 10:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=h3qafDbAv4AFM0OKA+Hmv4AMC8JtSMby5AxR8HWzkJw=;
	b=HLfyG7gX66eS6QgINPR363izBogVIpR5ep5BqNrCnjIE6Fea9r9tymK9s8t6je7FNq
	xbn4KeNT9U0fH6NC1dNinCDt9+xcG59ndd2eIyvustzgJorylNNEqvi29WNWMhciyEX5
	lstz+WyS754aqPnXoehgeS5oeXLzck0UxB4nlruJGMqXfV10EBjavLmK1o9gRTuv0GAC
	YBMrDZVNJfGiaKwHudvCKbkW+0JIQmZ74gl1XoCbbEW98w2YQII1JE0xilicIftBY4KC
	tSJ1nZ9nXs7LU/orVKWFiGZ2CIGs1kxHAKvCkogqxxTwEIHj4LPEgVGkSqbF6tUwGXyp
	bwmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=h3qafDbAv4AFM0OKA+Hmv4AMC8JtSMby5AxR8HWzkJw=;
	b=jxLjhTK6jQEJ8p+5b486ZN4ilHJCU6bwGnIcvY5n6tEmR816mBoFQzsFkhBK9klZ2s
	lJdqVhSORcCqduvSbPLuqOKAegf9cPLnr4PlblmgiJ4Vhwgg63Qn9S/Dch7TT27AEtDv
	lkLMf74WjPnDukYWgbLNhO08P+sTp5oYnbfhzfWqQuErCkvMeZiy4+oqdzUCNvHsoGN6
	Hd6SjhhRmlS5k9U3VVNAxhPYPnoPqESezzU1UuMpypbaaTi/OEcN4CgvVtq0DyTErr5j
	63XpAOm8qnzxw3mBIoLA6KatA4pyemP5r7Oj3hcFKDU5Yy7ZdeMGpdvHoblBO8w8NOiJ
	1m/Q==
X-Gm-Message-State: AKS2vOy3utvEmBxqeU6p2VStcKr8rVhSbiR4yR7VFA1CxAtiqOgnj3r6
	HzOJenpYU7Sbt3NiT4dfNVcrFxMWPg==
X-Received: by 10.46.70.9 with SMTP id t9mr2006642lja.117.1498584387940; Tue,
	27 Jun 2017 10:26:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.9.137 with HTTP; Tue, 27 Jun 2017 10:26:27 -0700 (PDT)
In-Reply-To: <1498551781-10414-1-git-send-email-zhe.he@windriver.com>
References: <1498551781-10414-1-git-send-email-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 27 Jun 2017 13:26:27 -0400
Message-ID: <CADkTA4Pkem1SEvCmgLOvDORzw_a9b9sr2z8WdgcmV0Jx0Hf5Vg@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-greenlet: uprev to 0.4.9
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
X-List-Received-Date: Tue, 27 Jun 2017 17:26:42 -0000
Content-Type: multipart/alternative; boundary="f403045f798c1bf7ea0552f45e86"

--f403045f798c1bf7ea0552f45e86
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Tue, Jun 27, 2017 at 4:23 AM, <zhe.he@windriver.com> wrote:

> From: Amy Fong <amy.fong@windriver.com>
>
> python-greenlet bugfixes from 0.3.4 - unstable issues. This resulted in
> the docker-registry (in some build scenarios) crashing repeatedly.
>
>     Traceback (most recent call last):
>       File "/usr/lib64/python2.7/site-packages/gunicorn/arbiter.py", line
> 507, in spawn_worker
>         worker.init_process()
>       File "/usr/lib64/python2.7/site-packages/gunicorn/workers/ggevent.py",
> line 193, in init_process
>         super(GeventWorker, self).init_process()
>       File "/usr/lib64/python2.7/site-packages/gunicorn/workers/base.py",
> line 120, in init_process
>         self.run()
>       File "/usr/lib64/python2.7/site-packages/gunicorn/workers/ggevent.py",
> line 117, in run
>         gevent.sleep(1.0)
>       File "/usr/lib64/python2.7/site-packages/gevent/hub.py", line 75,
> in sleep
>         hub.wait(loop.timer(seconds, ref=ref))
>       File "/usr/lib64/python2.7/site-packages/gevent/hub.py", line 341,
> in wait
>         result = waiter.get()
>       File "/usr/lib64/python2.7/site-packages/gevent/hub.py", line 568,
> in get
>         return self.hub.switch()
>       File "/usr/lib64/python2.7/site-packages/gevent/hub.py", line 331,
> in switch
>         return greenlet.switch(self)
>     SystemError: NULL result without error in PyObject_Call
>
>     <repeat>
>
> Signed-off-by: Amy Fong <amy.fong@windriver.com>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  recipes-devtools/python/python-greenlet_0.4.9.bb | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 recipes-devtools/python/python-greenlet_0.4.9.bb
>
> diff --git a/recipes-devtools/python/python-greenlet_0.4.9.bb
> b/recipes-devtools/python/python-greenlet_0.4.9.bb
> new file mode 100644
> index 0000000..fa35fa8
> --- /dev/null
> +++ b/recipes-devtools/python/python-greenlet_0.4.9.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "Python lightweight in-process concurrent programming"
> +HOMEPAGE = "http://pypi.python.org/pypi/greenlet"
> +SECTION = "devel/python"
> +LICENSE = "MIT & PSF"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
> +                    file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f6
> 9a"
> +SRC_URI = "http://pypi.python.org/packages/source/g/greenlet/
> greenlet-${PV}.tar.gz"
> +SRC_URI[md5sum] = "00bb1822d8511cc85f052e89d1fd919b"
> +SRC_URI[sha256sum] = "79f9b8bbbb1c599c66aed5e643e8b5
> 3bae697cae46e0acfc4ee461df48a90012"
> +
> +S = "${WORKDIR}/greenlet-${PV}"
> +
> +inherit distutils
> +
> --
> 2.8.1
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

--f403045f798c1bf7ea0552f45e86
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Tue, Jun 27, 2017 at 4:23 AM=
,  <span dir=3D"ltr">&lt;<a href=3D"mailto:zhe.he@windriver.com" target=3D"=
_blank">zhe.he@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">From: Amy Fong &lt;<a href=3D"mailto:amy.fong@windriver.com">amy.=
fong@windriver.com</a>&gt;<br>
<br>
python-greenlet bugfixes from 0.3.4 - unstable issues. This resulted in<br>
the docker-registry (in some build scenarios) crashing repeatedly.<br>
<br>
=C2=A0 =C2=A0 Traceback (most recent call last):<br>
=C2=A0 =C2=A0 =C2=A0 File &quot;/usr/lib64/python2.7/site-<wbr>packages/gun=
icorn/arbiter.py&quot;, line 507, in spawn_worker<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 worker.init_process()<br>
=C2=A0 =C2=A0 =C2=A0 File &quot;/usr/lib64/python2.7/site-<wbr>packages/gun=
icorn/workers/<wbr>ggevent.py&quot;, line 193, in init_process<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 super(GeventWorker, self).init_process()<br>
=C2=A0 =C2=A0 =C2=A0 File &quot;/usr/lib64/python2.7/site-<wbr>packages/gun=
icorn/workers/<wbr>base.py&quot;, line 120, in init_process<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.run()<br>
=C2=A0 =C2=A0 =C2=A0 File &quot;/usr/lib64/python2.7/site-<wbr>packages/gun=
icorn/workers/<wbr>ggevent.py&quot;, line 117, in run<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gevent.sleep(1.0)<br>
=C2=A0 =C2=A0 =C2=A0 File &quot;/usr/lib64/python2.7/site-<wbr>packages/gev=
ent/hub.py&quot;, line 75, in sleep<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 hub.wait(loop.timer(seconds, ref=3Dref))<br>
=C2=A0 =C2=A0 =C2=A0 File &quot;/usr/lib64/python2.7/site-<wbr>packages/gev=
ent/hub.py&quot;, line 341, in wait<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D waiter.get()<br>
=C2=A0 =C2=A0 =C2=A0 File &quot;/usr/lib64/python2.7/site-<wbr>packages/gev=
ent/hub.py&quot;, line 568, in get<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.hub.switch()<br>
=C2=A0 =C2=A0 =C2=A0 File &quot;/usr/lib64/python2.7/site-<wbr>packages/gev=
ent/hub.py&quot;, line 331, in switch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return greenlet.switch(self)<br>
=C2=A0 =C2=A0 SystemError: NULL result without error in PyObject_Call<br>
<br>
=C2=A0 =C2=A0 &lt;repeat&gt;<br>
<br>
Signed-off-by: Amy Fong &lt;<a href=3D"mailto:amy.fong@windriver.com">amy.f=
ong@windriver.com</a>&gt;<br>
Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@wi=
ndriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-devtools/python/<a href=3D"http://python-greenlet_0.4.9.bb" r=
el=3D"noreferrer" target=3D"_blank">python<wbr>-greenlet_0.4.9.bb</a> | 14 =
++++++++++++++<br>
=C2=A01 file changed, 14 insertions(+)<br>
=C2=A0create mode 100644 recipes-devtools/python/<a href=3D"http://python-g=
reenlet_0.4.9.bb" rel=3D"noreferrer" target=3D"_blank">python<wbr>-greenlet=
_0.4.9.bb</a><br>
<br>
diff --git a/recipes-devtools/python/<a href=3D"http://python-greenlet_0.4.=
9.bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-greenlet_0.4.9.bb</a=
> b/recipes-devtools/python/<a href=3D"http://python-greenlet_0.4.9.bb" rel=
=3D"noreferrer" target=3D"_blank">pyth<wbr>on-greenlet_0.4.9.bb</a><br>
new file mode 100644<br>
index 0000000..fa35fa8<br>
--- /dev/null<br>
+++ b/recipes-devtools/python/<a href=3D"http://python-greenlet_0.4.9.bb" r=
el=3D"noreferrer" target=3D"_blank">pyth<wbr>on-greenlet_0.4.9.bb</a><br>
@@ -0,0 +1,14 @@<br>
+SUMMARY =3D &quot;Python lightweight in-process concurrent programming&quo=
t;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://pypi.python.org/pypi/greenlet" rel=3D=
"noreferrer" target=3D"_blank">http://pypi.python.org/pypi/<wbr>greenlet</a=
>&quot;<br>
+SECTION =3D &quot;devel/python&quot;<br>
+LICENSE =3D &quot;MIT &amp; PSF&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>03143d7a1a9f5d8a0fee8=
25f24ca9c<wbr>36 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LICENSE.PSF;md5=3D<wbr>c106931d9429eda0492617f037b8f6<wbr>9a&quot;<br>
+SRC_URI =3D &quot;<a href=3D"http://pypi.python.org/packages/source/g/gree=
nlet/greenlet-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://pyp=
i.python.org/<wbr>packages/source/g/greenlet/<wbr>greenlet-${PV}.tar.gz</a>=
&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>00bb1822d8511cc85f052e89d1fd91<wbr>9b&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>79f9b8bbbb1c599c66aed5e643e8b5<wbr>3bae6=
97cae46e0acfc4ee461df48a9<wbr>0012&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/greenlet-${PV}&quot;<br>
+<br>
+inherit distutils<br>
+<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.8.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--f403045f798c1bf7ea0552f45e86--
