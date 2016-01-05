Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 46339E009F5; Tue,  5 Jan 2016 08:49:54 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_05_10, 
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.45 listed in list.dnswl.org]
	* 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML obfuscation
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com
	[209.85.213.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D0F80E0033E
	for <meta-virtualization@yoctoproject.org>;
	Tue,  5 Jan 2016 08:49:51 -0800 (PST)
Received: by mail-vk0-f45.google.com with SMTP id f2so230251313vkb.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 05 Jan 2016 08:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=rVSouqUBSITMRbEpQcrm+reeSMZn4vCA5oYf8SPwwJw=;
	b=hnyPaSCv8FHr+gExQFCWdqObxxY26MLeo+6rfSvLHy9xdZ1a46Cv0DfTkt3Sar3Q1p
	5ni8FCTgTlHspHR1mk60MEVMQhPpFAMZXhDhfcqsCFuo6/Doy4iq/uByNohaT8zZZRyw
	m9dX1yV6BK58gdQmALYCFUeDao6ycJp1VGPwULFYTcIoIi+INjX+rmd/63HrrhCYavRh
	BVqc2fUuufi1pb29KvOF26lDdyrI/54vN6YbrqEF94L7eUdDJ7Ui+KMGZHKQOLkJ/P3w
	/O4SyV1X0jo3zVq0pbjopDGvVcyCEdBsPtihK2ar/pLLoB9xeWq/OHDmyIKs1Top+gCu
	vXmw==
MIME-Version: 1.0
X-Received: by 10.31.44.77 with SMTP id s74mr64639338vks.4.1452012590700; Tue,
	05 Jan 2016 08:49:50 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Tue, 5 Jan 2016 08:49:50 -0800 (PST)
In-Reply-To: <1451921019-16491-1-git-send-email-josep.puigdemont@enea.com>
References: <1451921019-16491-1-git-send-email-josep.puigdemont@enea.com>
Date: Tue, 5 Jan 2016 11:49:50 -0500
Message-ID: <CADkTA4O5OqE+RijWN5KUD-pntf7Pf6Lo5zP14To55Uc7HcPbwQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][fido-kilo][PATCH 0/5] Updates for fido-kilo
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
X-List-Received-Date: Tue, 05 Jan 2016 16:49:54 -0000
Content-Type: multipart/alternative; boundary=001a11c075a2ad9d5c052899065f

--001a11c075a2ad9d5c052899065f
Content-Type: text/plain; charset=UTF-8

I've merged the series to fido-kilo.

Bruce

On Mon, Jan 4, 2016 at 10:23 AM, Josep Puigdemont <josep.puigdemont@enea.com
> wrote:

> Upgrade some recipes to their latest Kilo version
>
> Josep Puigdemont (5):
>   python-taskflow: upgrade to 0.7.1 (kilo)
>   python-glance: upgrade to 2015.1.2 (kilo)
>   python-swift: upgrade to 2.3.0
>   python-cinder: upgrade to 2015.1.2 (kilo)
>   python-ceilometerclient: upgrade to 1.1.2
>
>  .../recipes-devtools/python/python-ceilometerclient_git.bb     |  8
> +++-----
>  meta-openstack/recipes-devtools/python/python-cinder_git.bb    |  7
> +++----
>  meta-openstack/recipes-devtools/python/python-glance_git.bb    |  7
> +++----
>  meta-openstack/recipes-devtools/python/python-swift_git.bb     |  7
> +++----
>  meta-openstack/recipes-devtools/python/python-taskflow_git.bb  | 10
> +++++-----
>  5 files changed, 17 insertions(+), 22 deletions(-)
>
> --
> 2.5.0
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

--001a11c075a2ad9d5c052899065f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;ve merged the series to fido-kilo.<br><br></div=
>Bruce<br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">O=
n Mon, Jan 4, 2016 at 10:23 AM, Josep Puigdemont <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:josep.puigdemont@enea.com" target=3D"_blank">josep.puigdemont=
@enea.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Upgrade =
some recipes to their latest Kilo version<br>
<br>
Josep Puigdemont (5):<br>
=C2=A0 python-taskflow: upgrade to 0.7.1 (kilo)<br>
=C2=A0 python-glance: upgrade to 2015.1.2 (kilo)<br>
=C2=A0 python-swift: upgrade to 2.3.0<br>
=C2=A0 python-cinder: upgrade to 2015.1.2 (kilo)<br>
=C2=A0 python-ceilometerclient: upgrade to 1.1.2<br>
<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python-ceilometerclient=
_git.bb" rel=3D"noreferrer" target=3D"_blank">python-ceilometerclient_git.b=
b</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 8 +++-----<br>
=C2=A0meta-openstack/recipes-devtools/python/<a href=3D"http://python-cinde=
r_git.bb" rel=3D"noreferrer" target=3D"_blank">python-cinder_git.bb</a>=C2=
=A0 =C2=A0 |=C2=A0 7 +++----<br>
=C2=A0meta-openstack/recipes-devtools/python/<a href=3D"http://python-glanc=
e_git.bb" rel=3D"noreferrer" target=3D"_blank">python-glance_git.bb</a>=C2=
=A0 =C2=A0 |=C2=A0 7 +++----<br>
=C2=A0meta-openstack/recipes-devtools/python/<a href=3D"http://python-swift=
_git.bb" rel=3D"noreferrer" target=3D"_blank">python-swift_git.bb</a>=C2=A0=
 =C2=A0 =C2=A0|=C2=A0 7 +++----<br>
=C2=A0meta-openstack/recipes-devtools/python/<a href=3D"http://python-taskf=
low_git.bb" rel=3D"noreferrer" target=3D"_blank">python-taskflow_git.bb</a>=
=C2=A0 | 10 +++++-----<br>
=C2=A05 files changed, 17 insertions(+), 22 deletions(-)<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.5.0<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for cha=
os and madness await thee at its end&quot;</div>
</div>

--001a11c075a2ad9d5c052899065f--
