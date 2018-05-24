Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B20C0E006F1; Thu, 24 May 2018 13:09:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_05_10, 
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.47 listed in list.dnswl.org]
	* 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML obfuscation
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B3833E0044F
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 May 2018 13:09:01 -0700 (PDT)
Received: by mail-wm0-f47.google.com with SMTP id x2-v6so1349174wmh.5
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 May 2018 13:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bGsFlNKXknbmVLxPZI3R5ibA6sUm3Zq4BygSqHIHrg4=;
	b=NxSUrdqYmaLQFDiHDlC2B+ndVK3yVS+0Y/3t+R3p886NLyZT2RM2fyZ4ngeUdtPucm
	xR7+PXCgauzocu2LIzqLw8ctQGcfmUnhmZUl0BvK2aaR/QuymydBPeBFIrr7RLKHUT3F
	N8OQ9P9hPvYtrG1onA6natyYzciW6Gnx4DT7pFkasJFOj9OHj9oZDr0Fms1zBPwB3cdF
	HdSu4Nf6G2KiXiQXvuJ0LDr8f7x4yxRWudO2zrYl9t+94Pt+donhkaUTRiFrubuTpUhz
	krcXrIlz0o7gzO2sB+dXuGGTEK6sbZlL+YPE8iKMrIYcI/dlLtjfnmimiacXt2v5mQ+2
	PeBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bGsFlNKXknbmVLxPZI3R5ibA6sUm3Zq4BygSqHIHrg4=;
	b=bvDhKvxEqaEKgeNhuiketirD0pvDmGZjpOugiy7SyHjK1gAfMnvie8hm8VG20CP70W
	9BSPseYgEPhvvQz9KJ2eGkdSLRK8QUqT8ZY3WFbs3ogfU4gNd9FmotUMzaWZAY5NTbJ3
	Jt0PAymewRg9pqWv6hn/ox2KpAneCzT6Tphb1Hw8ZSJv4HtWc4hTi2fD+yfVqIIvwt1D
	sC/rIeq1tZOjeDMhvx2WrQvSG0/7g0uN3ls6EaHcrnFpuNug2YTyIwOerx/U184Ku6vq
	4XjeXt0R+UAdZG1Ah0x2pk4LWeP/ejQ2fb7yqBbZf8rBbEUAxF8Tseizaj/ldXZQyhzW
	oByQ==
X-Gm-Message-State: ALKqPwe62ECAMAfATvjpBKOOMHQQS/9z0euTl8Fvl7MeFq5Xytd3EMPu
	PUf9L+xidI3HhivdtnYUUZJNvUuuPIRNA4aFaMA9nw==
X-Google-Smtp-Source: AB8JxZpgGF6O7UERb2BBmmR0UIcbXT1DNqpOLJ9hb3Q2wXO+/GE9lOMG6SYvxoQ/90whNfdmMxFsOE2CrTMGqkRf6QE=
X-Received: by 2002:a2e:8350:: with SMTP id
	l16-v6mr5716531ljh.28.1527192540500; 
	Thu, 24 May 2018 13:09:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.51.7 with HTTP; Thu, 24 May 2018 13:09:00 -0700 (PDT)
In-Reply-To: <1526058191-56109-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1526058191-56109-1-git-send-email-leimaohui@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 24 May 2018 16:09:00 -0400
Message-ID: <CADkTA4PSzZs77e95M4f9SaXAd14-78g8YuXoOFp+eeinG9TTKg@mail.gmail.com>
To: Lei Maohui <leimaohui@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [oe-virtualization][meta-cloud-services][PATCH 0/8] Fix build error
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
X-List-Received-Date: Thu, 24 May 2018 20:09:02 -0000
Content-Type: multipart/alternative; boundary="000000000000e156c5056cf9388c"

--000000000000e156c5056cf9388c
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Fri, May 11, 2018 at 1:03 PM, Lei Maohui <leimaohui@cn.fujitsu.com>
wrote:

> Fix build error as following:
>
> "distutils.errors.DistutilsError: Could not find suitable distribution
> for Requirement.parse('pbr>=2.0.0')"
>
> Lei Maohui (8):
>   python-debtcollector Fix buid error as following:
>   python-keystone: Fix build error as following:
>   python-keystoneauth1: Fix build error as following:
>   python-positional: Fix build error as following:
>   python-oslo.concurrency: Fix build error as following:
>   python-cinderclient: Fix build error as following:
>   python-neutronclient: Fix build error as following:
>   python-novaclient: Fix build error as following:
>
>  meta-openstack/recipes-devtools/python/python-cinderclient_git.bb  | 5
> +++++
>  .../recipes-devtools/python/python-debtcollector_1.17.1.bb         | 5
> +++++
>  meta-openstack/recipes-devtools/python/python-keystone_git.bb      | 5
> +++++
>  .../recipes-devtools/python/python-keystoneauth1_3.2.0.bb          | 5
> +++++
>  meta-openstack/recipes-devtools/python/python-neutronclient_git.bb | 5
> +++++
>  meta-openstack/recipes-devtools/python/python-novaclient_git.bb    | 5
> +++++
>  .../recipes-devtools/python/python-oslo.concurrency_git.bb         | 5
> +++++
>  meta-openstack/recipes-devtools/python/python-positional_1.1.1.bb  | 7
> ++++++-
>  8 files changed, 41 insertions(+), 1 deletion(-)
>
> --
> 1.9.1
>
>
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

--000000000000e156c5056cf9388c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Fri, May 11, 2018 at 1:03 PM=
, Lei Maohui <span dir=3D"ltr">&lt;<a href=3D"mailto:leimaohui@cn.fujitsu.c=
om" target=3D"_blank">leimaohui@cn.fujitsu.com</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">Fix build error as following:<br>
<br>
&quot;distutils.errors.<wbr>DistutilsError: Could not find suitable distrib=
ution for Requirement.parse(&#39;pbr&gt;=3D2.0.0&#39;<wbr>)&quot;<br>
<br>
Lei Maohui (8):<br>
=C2=A0 python-debtcollector Fix buid error as following:<br>
=C2=A0 python-keystone: Fix build error as following:<br>
=C2=A0 python-keystoneauth1: Fix build error as following:<br>
=C2=A0 python-positional: Fix build error as following:<br>
=C2=A0 python-oslo.concurrency: Fix build error as following:<br>
=C2=A0 python-cinderclient: Fix build error as following:<br>
=C2=A0 python-neutronclient: Fix build error as following:<br>
=C2=A0 python-novaclient: Fix build error as following:<br>
<br>
=C2=A0meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
cinderclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>cinde=
rclient_git.bb</a>=C2=A0 | 5 +++++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python-debtcollector_1.=
17.1.bb" rel=3D"noreferrer" target=3D"_blank">py<wbr>thon-debtcollector_1.1=
7.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 +++++<br>
=C2=A0meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
keystone_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>keystone_=
git.bb</a>=C2=A0 =C2=A0 =C2=A0 | 5 +++++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python-keystoneauth1_3.=
2.0.bb" rel=3D"noreferrer" target=3D"_blank">py<wbr>thon-keystoneauth1_3.2.=
0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 5 +++++<br>
=C2=A0meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
neutronclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>neut=
ronclient_git.bb</a> | 5 +++++<br>
=C2=A0meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
novaclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>novacli=
ent_git.bb</a>=C2=A0 =C2=A0 | 5 +++++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python-oslo.concurrency=
_git.bb" rel=3D"noreferrer" target=3D"_blank">py<wbr>thon-oslo.concurrency_=
git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 +++++<br>
=C2=A0meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
positional_1.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>posit=
ional_1.1.1.bb</a>=C2=A0 | 7 ++++++-<br>
=C2=A08 files changed, 41 insertions(+), 1 deletion(-)<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888"><br>
-- <br>
1.9.1<br>
<br>
<br>
<br>
-- <br>
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

--000000000000e156c5056cf9388c--
