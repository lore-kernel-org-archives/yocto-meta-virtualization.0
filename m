Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 15287E00903; Tue, 22 May 2018 05:10:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.44 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 39AB1E0086B
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 May 2018 05:09:58 -0700 (PDT)
Received: by mail-wm0-f44.google.com with SMTP id w194-v6so31089698wmf.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 May 2018 05:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HQghb1VErfdeHIlZ/59gi/ukEQAn5eWQ3tcG0kyzjXI=;
	b=tpAmcKcFTB84xXMjjZfe8QSzJ+3WOszyVeZnWdTFN3cAuW8rOhAs5I4tKY4pDg+Y4S
	mUh5X8c3dW0muiPP/FKu66AtqD4F/QVgCwx4LJO0uGpHh4W79TcWNMNDZjkwx9j5Zqt1
	eMjR50Lt0OUg8NUwzvV8fSxF9PmtJaWW/j090+5NPs6gYItzTje61K1M9ZDlP9b2ezeH
	8lzFBlcIqSRkYpBddh2X01Rj3z7RQLruyu9kk7fWPyPRzKtSjZjefbBTFXbx9C/GAzsS
	lR0GWPMzO/qId+Y14zu6qNLhybfY7hFrugkaIEE+P0x+Igar3o2pEz4hSu1rYPBIt29H
	QZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HQghb1VErfdeHIlZ/59gi/ukEQAn5eWQ3tcG0kyzjXI=;
	b=f1p1M6xFiUkFbcc3ZWNhlfl9rjdmk6ucTm6XxMDHHUMQlv/6Tq+L7nATU1KufZH6TM
	K/wDrBGocwOIMIyxceBWk7bQHzLXMqaoYqLuDm0pLWON7r6G8AIA4eB9irHDU8YiophL
	c/EhWOMqtgeeifwYF7qbOzyTF43+45I1nphbB9EO68RLfdrTLQZ7++ZWsKI7j2dt8tc0
	ZT1lxGInfBM2znPk1Ru64zJSdybU0V8qkcFj3XvnTy7jberq5tZFBiIkUjbF/u5A64yM
	D5w7+tmwjXP5Y/VvDFEwdr73kndTyLVBqx8b66W6iQp+x2QwguvKWLFXDBWeUH571hRi
	0h2g==
X-Gm-Message-State: ALKqPwdz9c3gtSAg8LS/KQEdaTgDwFPeQ01L4VJypeMR0JkKYJWyMYfc
	1b8TprpzUBQ87dWgGgVWmI8Ga3OhfbBlqQZb4Uc=
X-Google-Smtp-Source: AB8JxZrowCSZjmP8cFaZAvOk4eSxw2YK+OIhhorxFtnLegdQ3gLarCIQj5wwAR2mrYY5nG5r92BAWzXHMQwCCf8GXac=
X-Received: by 2002:a2e:82d6:: with SMTP id
	n22-v6mr14461891ljh.142.1526990997965; 
	Tue, 22 May 2018 05:09:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.51.7 with HTTP; Tue, 22 May 2018 05:09:57 -0700 (PDT)
In-Reply-To: <trinity-a3db492f-8222-4da7-866b-d0290300a2c4-1526989134941@3c-app-webde-bap43>
References: <trinity-a3db492f-8222-4da7-866b-d0290300a2c4-1526989134941@3c-app-webde-bap43>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 22 May 2018 08:09:57 -0400
Message-ID: <CADkTA4OsWJoD5X9DuRZjoYA4aAAQ_qdT0WJSnKoTZGK83ojrQw@mail.gmail.com>
To: Nicolai Weis <nicolai.weis@web.de>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: Question Integration of LXC
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
X-List-Received-Date: Tue, 22 May 2018 12:10:00 -0000
Content-Type: multipart/alternative; boundary="000000000000025064056cca4c4d"

--000000000000025064056cca4c4d
Content-Type: text/plain; charset="UTF-8"

On Tue, May 22, 2018 at 7:38 AM, Nicolai Weis <nicolai.weis@web.de> wrote:

> Hi all,
>
> In a project I want to integrate lxc-containers into the
> core-image-minimal for the minnowboard turbot. Therefore I'm using the
> krogoth branch (have to use this branch) for the meta-layers.
> As described in the README-file I add meta-virtualization, meta-oe,
> meta-networking, meta-filesystems and meta-python to the bblayers.conf. In
> the local.conf
> I added at the end of the file BBFILE_PRIORITY_openembedded-layer = "4"
> and IMAGE_INSTALL_append = " lxc" (lxc_2.0.0.bb).
>
> After the sucessful build I start the image and created with the
> busybox-template - should I use a different template? - a lxc-busybox
> container. I tried to start the container, but the error
> "1079 failed initializing cgroup support" appeared. lxc-checkconfig showed
> cgroup-namespaces: required. I tried to solve this with adding cgroup-lite
> to IMAGE_INSTALL_append, but it
> didn't change anything (only let cgroup-namespaces disappear and showed
> Cgroup clone_children flag: enabled). I'm using sysvinit instead of systemd.
>
>
What kernel are you using ? This typically means that the kernel config
isn't correct.
If you aren't using linux-yocto, then the fragments we have in the layer
are likely
not being applied, and you'll need to manually configure your kernel with
the right
options.

Otherwise, it could be that the cgroups are not being mounted properly by
your
recipe, so have a look and confirm if cgroups or cgroups2 are in fact
mounted in
your image.

Bruce


> Do I have to change some configurations in the lxc-recipe? I would be very
> grateful if you can give me some information about it.
>
> Thanks
> Nicolai
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--000000000000025064056cca4c4d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, May 22, 2018 at 7:38 AM, Nicolai Weis <span dir=3D"ltr">&lt;<a href=3D"=
mailto:nicolai.weis@web.de" target=3D"_blank">nicolai.weis@web.de</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div><div style=3D"font-fami=
ly:Verdana;font-size:12px"><div>
<div>Hi all,<br>
=C2=A0</div>

<div>In a project I want to integrate lxc-containers into the core-image-mi=
nimal for the minnowboard turbot. Therefore I&#39;m using the krogoth branc=
h (have to use this branch) for the meta-layers.</div>

<div>As described in the README-file I add meta-virtualization, meta-oe, me=
ta-networking, meta-filesystems and meta-python to the bblayers.conf. In th=
e local.conf</div>

<div>I added at the end of the file BBFILE_PRIORITY_openembedded-l<wbr>ayer=
 =3D &quot;4&quot; and IMAGE_INSTALL_append =3D &quot; lxc&quot; (<a href=
=3D"http://lxc_2.0.0.bb" target=3D"_blank">lxc_2.0.0.bb</a>).<br>
=C2=A0</div>

<div>After the sucessful build I start the image and created with the busyb=
ox-template - should I use a different template? - a lxc-busybox container.=
 I tried to start the container, but the error</div>

<div>&quot;1079 failed initializing cgroup support&quot; appeared. lxc-chec=
kconfig showed cgroup-namespaces: required. I tried to solve this with addi=
ng cgroup-lite to IMAGE_INSTALL_append, but it</div>
didn&#39;t change anything (only let cgroup-namespaces disappear and showed=
 Cgroup clone_children flag: enabled). I&#39;m using sysvinit instead of sy=
stemd.<br>
<br></div></div></div></blockquote><div><br></div><div>What kernel are you =
using ? This typically means that the kernel config isn&#39;t correct.=C2=
=A0</div><div>If you aren&#39;t using linux-yocto, then the fragments we ha=
ve in the layer are likely</div><div>not being applied, and you&#39;ll need=
 to manually configure your kernel with the right</div><div>options.</div><=
div><br></div><div>Otherwise, it could be that the cgroups are not being mo=
unted properly by your</div><div>recipe, so have a look and confirm if cgro=
ups or cgroups2 are in fact mounted in</div><div>your image.</div><div><br>=
</div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>=
<div style=3D"font-family:Verdana;font-size:12px"><div>
Do I have to change some configurations in the lxc-recipe? I would be very =
grateful if you can give me some information about it.<br>
<br>
Thanks<span class=3D"gmail-HOEnZb"><font color=3D"#888888"><br>
Nicolai</font></span></div></div></div>
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
</div></div>

--000000000000025064056cca4c4d--
