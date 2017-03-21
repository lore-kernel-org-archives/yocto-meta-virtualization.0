Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B6761E00867; Tue, 21 Mar 2017 05:24:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.216.173 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.173 listed in dnsbl.sorbs.net]
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
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 306BAE00726
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Mar 2017 05:24:31 -0700 (PDT)
Received: by mail-qt0-f173.google.com with SMTP id x35so129023378qtc.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Mar 2017 05:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xIFHf4K5T8kgFiHtj0iQyIscbf3ByFWdgiaCCAYfhW8=;
	b=qvD01G0zDlJkIC9eGukSyW226zhXwarfKRA8KSDxorQynDTM0UkLQmv02iPtnSo/rC
	O4JtlQUx1zcgLtzr8zE3nmRRYDuxlcj1cv6sJ3KNh+L+WKb4treIINJDsg6rwGQPx3aS
	LJtnJWQ0/ZtC0HQy3oLRVL6iziD5yXT4MfVpIjzqdsWQG0L+qs3AXmMb3YvGVmn78K9j
	QzL/udhfp+CLJPz/8RyP3r0XYxeZwJFSRH+WLNkUp7Au+shHbxif6KNdT4P9orAEjndV
	8gNWnIcdp6EgqnNKuK06A2nHK2haKZm/VnoDB4v4/xhVB58YV05OWKLke+x9P2vjssr7
	K4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xIFHf4K5T8kgFiHtj0iQyIscbf3ByFWdgiaCCAYfhW8=;
	b=XqSDZMbIl7BK+6n1bi+cI4UAjh5Cx6SbcIXqp0eWfSN5TUso8zrD7Gav6FGIuxILVA
	nFWuRJ0RcZLvEyNmjAm3CBE9IZVOPSxWdeDkWXTr/wgqWBC7PhUDPomrjXl8nmimmoaf
	uFoi7ab8vbGUfInsuzE46yWDFumMr1TpP3FQFIkib4QfQXrY0ciiTXF9szkPI/9DdesO
	xQzlEkmasMnet1X3Yxbu5+WxohoiNUWAfcyAqYh5oNIN+Xd+A9c0W1waq8SbApCGWcPl
	z6JBYmb1heaBCqmmb1bc9FT4stv1JPpdw62L7blKxzGx75DpKz4ho2m/Dew71kZdtMvZ
	M0hw==
X-Gm-Message-State: AFeK/H1flEHYNdWlJV/7THxdi1lyyB4+oc/lZm1UgNo+M/mIomnFfaxGYzwjXmGFIFK7IEN5eNc9nmCvD7WU2w==
X-Received: by 10.237.34.212 with SMTP id q20mr30971424qtc.5.1490099071015;
	Tue, 21 Mar 2017 05:24:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.69 with HTTP; Tue, 21 Mar 2017 05:24:30 -0700 (PDT)
In-Reply-To: <CADkTA4MGjEQ3dfbDxKGoJoLosC_B9XUA8McgWa9mCCy8S8KNwA@mail.gmail.com>
References: <20170321035947.13930-1-raj.khem@gmail.com>
	<20170321035947.13930-3-raj.khem@gmail.com>
	<CADkTA4MGjEQ3dfbDxKGoJoLosC_B9XUA8McgWa9mCCy8S8KNwA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 21 Mar 2017 08:24:30 -0400
Message-ID: <CADkTA4MiUrtt4x001TjTBhrtw_OUPPUVoVvYD4psXf4C9m+kDA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [[PATCH 3/6] seabios: Its x86 only package
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
X-List-Received-Date: Tue, 21 Mar 2017 12:24:33 -0000
Content-Type: multipart/alternative; boundary=001a11375e08cee876054b3cb9ad

--001a11375e08cee876054b3cb9ad
Content-Type: text/plain; charset=UTF-8

I should mention that I have my pending queue on master-next.

I've staged three of these patches, and put the containers/GOROOT patch on
top of
my other go fixes.

You can see the WIP in master-next, and it should be pushed later today.

That leaves only the patch I was asking to be split, and if you don't have
the time to
do it, let me know, and I can do the split here.

Cheers,

Bruce

On Tue, Mar 21, 2017 at 8:17 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> Staged.
>
> Bruce
>
> On Mon, Mar 20, 2017 at 11:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  recipes-extended/seabios/seabios_1.9.1.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/recipes-extended/seabios/seabios_1.9.1.bb
>> b/recipes-extended/seabios/seabios_1.9.1.bb
>> index 88f2963..5c095ac 100644
>> --- a/recipes-extended/seabios/seabios_1.9.1.bb
>> +++ b/recipes-extended/seabios/seabios_1.9.1.bb
>> @@ -23,6 +23,8 @@ TUNE_CCARGS = ""
>>  EXTRA_OEMAKE += "HOSTCC='${BUILD_CC}'"
>>  EXTRA_OEMAKE += "CROSS_PREFIX=${TARGET_PREFIX}"
>>
>> +COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
>> +
>>  do_configure() {
>>      oe_runmake defconfig
>>  }
>> --
>> 2.12.0
>>
>>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11375e08cee876054b3cb9ad
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I should mention that I have my pending queue on master-ne=
xt.=C2=A0<div><br></div><div>I&#39;ve staged three of these patches, and pu=
t the containers/GOROOT patch on top of</div><div>my other go fixes.</div><=
div><br></div><div>You can see the WIP in master-next, and it should be pus=
hed later today.</div><div><br></div><div>That leaves only the patch I was =
asking to be split, and if you don&#39;t have the time to</div><div>do it, =
let me know, and I can do the split here.</div><div><br></div><div>Cheers,<=
/div><div><br></div><div>Bruce</div></div><div class=3D"gmail_extra"><br><d=
iv class=3D"gmail_quote">On Tue, Mar 21, 2017 at 8:17 AM, Bruce Ashfield <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_=
blank">bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr">Staged.<div><br></div><div>Bruce</div></div>=
<div class=3D"gmail_extra"><div><div class=3D"h5"><br><div class=3D"gmail_q=
uote">On Mon, Mar 20, 2017 at 11:59 PM, Khem Raj <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Signed-off-by: Khem Raj=
 &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail=
.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/seabios/<a href=3D"http://seabios_1.9.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">seab<wbr>ios_1.9.1.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/recipes-extended/seabios/<a href=3D"http://seabios_1.9.1.bb" r=
el=3D"noreferrer" target=3D"_blank">sea<wbr>bios_1.9.1.bb</a> b/recipes-ext=
ended/seabios/<a href=3D"http://seabios_1.9.1.bb" rel=3D"noreferrer" target=
=3D"_blank">sea<wbr>bios_1.9.1.bb</a><br>
index 88f2963..5c095ac 100644<br>
--- a/recipes-extended/seabios/<a href=3D"http://seabios_1.9.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">sea<wbr>bios_1.9.1.bb</a><br>
+++ b/recipes-extended/seabios/<a href=3D"http://seabios_1.9.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">sea<wbr>bios_1.9.1.bb</a><br>
@@ -23,6 +23,8 @@ TUNE_CCARGS =3D &quot;&quot;<br>
=C2=A0EXTRA_OEMAKE +=3D &quot;HOSTCC=3D&#39;${BUILD_CC}&#39;&quot;<br>
=C2=A0EXTRA_OEMAKE +=3D &quot;CROSS_PREFIX=3D${TARGET_PREFIX}<wbr>&quot;<br=
>
<br>
+COMPATIBLE_HOST =3D &quot;(i.86|x86_64).*-linux&quot;<br>
+<br>
=C2=A0do_configure() {<br>
=C2=A0 =C2=A0 =C2=A0oe_runmake defconfig<br>
=C2=A0}<br>
<span class=3D"m_-6042048761705046929HOEnZb"><font color=3D"#888888">--<br>
2.12.0<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div></div=
></div><span class=3D"HOEnZb"><font color=3D"#888888">-- <br><div class=3D"=
m_-6042048761705046929gmail_signature" data-smartmail=3D"gmail_signature">&=
quot;Thou shalt not follow the NULL pointer, for chaos and madness await th=
ee at its end&quot;</div>
</font></span></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div>

--001a11375e08cee876054b3cb9ad--
