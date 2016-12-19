Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EC81DE00B8F; Sun, 18 Dec 2016 19:44:55 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, 
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.220.196 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.196 listed in dnsbl.sorbs.net]
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
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 56971E00B2B
	for <meta-virtualization@yoctoproject.org>;
	Sun, 18 Dec 2016 19:44:55 -0800 (PST)
Received: by mail-qk0-f196.google.com with SMTP id n21so524207qka.0
	for <meta-virtualization@yoctoproject.org>;
	Sun, 18 Dec 2016 19:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UMGSq42MKLF9vY1F5KTkM+iVjVnLTtmVtu+/C64/PAc=;
	b=e1hnKteq1Oe5o3ef+ctNSRhZIQDiRBm03PFIL64SRua8phlLzRdnnk5O1OwneDx6m/
	tPE2ic0qkbDtJiDUoi1XgEf9BkaV28D1ygbTk/LZiIkTqR3L+1y+e3n17wwO7MxdNN/W
	UAXduKROFtY47/pQ93aDDIEMnIJ1tLz/i6nWOpT90kSq5HA1S5a/zKa4A3xTDqh8L1rn
	7e3GG+BHmst1scw+3IMUf5AszSiMFCgMBCdjf5DUrnNU3sirs9+1F5M+wlfW6L7Aospp
	3GUaquLeo3HECsucW9PtOkhQxMAjN/2rBbC8qgXoYMJCDIo84zcmDXiVvsxF7UC8YGDT
	zUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UMGSq42MKLF9vY1F5KTkM+iVjVnLTtmVtu+/C64/PAc=;
	b=nQHj8Kve3gcmttMa/JyoZIGcvaO1Xnvc7Yc6ynXJa/g3NfZIfWr1ESJdpLO4U59JcF
	DEm1vXaZKluqxzFhq82hMQBOAvjWcEFILBTAZNfrgWzfbKrY01pb8+tuhBjX0EwMIOCT
	xTz/63JlEBWuM/00vA/JQJvpQe/rzhqBlK40eTCs4kRZ+dXH4rHpS9te+4oomwu+wiEl
	GuCdhdC0pcSW3ClWlrtU2JqZL6YJ3QxosK34jEm0y+4wqpfKR8I1e8OxJhI8BE3UE+EG
	l97gLrR0Eod5ufkhSvUJUprBA4XZeM3P3w5NF4fy3DwySzSIHQvxkbMKb6+n+XcGwjJ3
	uVsQ==
X-Gm-Message-State: AIkVDXIoHyq+bUVFHKUf7rQpXXlScpbGPLcYv+XSmyjL2zB4Ot6cIXx7RrtypLLdyT8OnLtni+KIb/lLlRCT0A==
X-Received: by 10.55.145.132 with SMTP id t126mr2828qkd.211.1482119094701;
	Sun, 18 Dec 2016 19:44:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.129.227 with HTTP; Sun, 18 Dec 2016 19:44:54 -0800 (PST)
In-Reply-To: <194b570c-c45c-1816-9041-96eb615fdebb@cardoe.com>
References: <20161218164456.30100-1-cardoe@cardoe.com>
	<194b570c-c45c-1816-9041-96eb615fdebb@cardoe.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 18 Dec 2016 22:44:54 -0500
Message-ID: <CADkTA4Oc3ZXiYKTUrKNRYqC+B6yO6pBU7ByVp0XAzRSyPPUM-A@mail.gmail.com>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: Derek Straka <derek@asterius.io>, "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/3] xen: add extra generated file to package
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
X-List-Received-Date: Mon, 19 Dec 2016 03:44:56 -0000
Content-Type: multipart/alternative; boundary=94eb2c083d8427941c0543fabe1d

--94eb2c083d8427941c0543fabe1d
Content-Type: text/plain; charset=UTF-8

On Sun, Dec 18, 2016 at 12:00 PM, Doug Goldstein <cardoe@cardoe.com> wrote:

> On 12/18/16 10:44 AM, Doug Goldstein wrote:
>
> Bruce,
>
> Please apply this series to morty and master please. This is to prevent
> morty from getting a bit stale.
>
> Some background on the users of meta-virtualization for Xen that I know.
> Derek and I both used Xen 4.7.0 for krogoth and going forward we're
> using Xen 4.8.0 (and probably 4.8.1 when it drops) for morty. The OpenXT
> folks are looking to use meta-virtualization with pyro and will likely
> be aiming at Xen 4.9.0 which is the same that Derek and I will be aiming
> for with pyro. So I'm looking to hopefully keep the versions in
> meta-virtualization more up to date so that we get more users, even if
> that potentially means doing a version bump after a Yocto release drops
> (e.g. morty has dropped and we're bumping the version in this series).
>


I'm ok with the strategy .. I don't feel the need to only to bug fixes in
the released branches, if a specific version is what the user base needs,
and the update looks sane, we'll go for it.

Cheers,

Bruce


>
> --
> Doug Goldstein
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c083d8427941c0543fabe1d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sun, Dec 18, 2016 at 12:00 PM, Doug Goldstein <span dir=3D"ltr">&lt;=
<a href=3D"mailto:cardoe@cardoe.com" target=3D"_blank">cardoe@cardoe.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 12/18/16 10:44 AM,=
 Doug Goldstein wrote:<br>
<br>
Bruce,<br>
<br>
Please apply this series to morty and master please. This is to prevent<br>
morty from getting a bit stale.<br>
<br>
Some background on the users of meta-virtualization for Xen that I know.<br=
>
Derek and I both used Xen 4.7.0 for krogoth and going forward we&#39;re<br>
using Xen 4.8.0 (and probably 4.8.1 when it drops) for morty. The OpenXT<br=
>
folks are looking to use meta-virtualization with pyro and will likely<br>
be aiming at Xen 4.9.0 which is the same that Derek and I will be aiming<br=
>
for with pyro. So I&#39;m looking to hopefully keep the versions in<br>
meta-virtualization more up to date so that we get more users, even if<br>
that potentially means doing a version bump after a Yocto release drops<br>
(e.g. morty has dropped and we&#39;re bumping the version in this series).<=
br></blockquote><div><br></div><div><br></div><div>I&#39;m ok with the stra=
tegy .. I don&#39;t feel the need to only to bug fixes in the released bran=
ches, if a specific version is what the user base needs, and the update loo=
ks sane, we&#39;ll go for it.</div><div><br></div><div>Cheers,</div><div><b=
r></div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Doug Goldstein<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--94eb2c083d8427941c0543fabe1d--
