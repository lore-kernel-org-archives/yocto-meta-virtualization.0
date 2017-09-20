Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 73DD9E00CD3; Tue, 19 Sep 2017 19:15:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.171 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.171 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F3580E00C2B
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Sep 2017 19:15:28 -0700 (PDT)
Received: by mail-qk0-f171.google.com with SMTP id a128so1445690qkc.5
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Sep 2017 19:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OshelC8XZiok5+zDrjp76KiNyf4psypgoGF8TjIfKNg=;
	b=hC75Y4RO8r7m7leU/jNkC/kneoKEvwLluD5K/VJMjhRDcTu1Y9Sv281EM0R52o+gJ/
	77h+pIAutlYAsvId2yJjmV/hgfhk9j9Oe62uDiE7vVmzWOtbbsrVoMvkukANHg5XM+J8
	/b5UK33b/p+KhY7hhaEYbPFRokEvD3eBkN61+xI0GaGPRoNhUNp7/ooVBz1/2LAuaelF
	XslulVHTYjtARL202wPSW/P5rAYzw5dIgb3AaDcwECoofsBwelFobF5OZ/kcwKaUQSTE
	zyc69KeuCe6jLBaxzW1J21s2L4OJWk3FRlH/zXTCd1hbBGdACso661CM3pSj51zpNi1x
	qaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OshelC8XZiok5+zDrjp76KiNyf4psypgoGF8TjIfKNg=;
	b=VLBA/N6FUvwCTZssxUDOEm+6HT7Qa7jtl+IfSrvC2q+24otRYMDmSDmoC9mE4Y4znq
	0hIiL4zPOZv470huy7xLtnEmd4hoAzWqRwuDLK/RBTmtpPzZMvtgC/85Rb0vmB9GxbJ6
	nzZQqm4aFAoads9RdKIJYIDLxeFZlDf993Sx1NNFdn8oCV3qRgH3r5LbbErvlhBo29cD
	TS/hY3Sy8/hT18cd1r6i3Vvxcxv4Kx9QlJuD1V1acqtECN9Jv34J1AARhUp1n5Dv4rZh
	/fV6qeyFUt2xALgElbd0h+HSQBRc8jP0umsV9lCIVXeSU21IR87LVmJ/apv0CN2QtxqW
	oPZw==
X-Gm-Message-State: AHPjjUh4fhrJQjVYfl96DIDqSh/gnm/z/z5M68pK47JxXbCDb9kbz+qO
	A7ZWKYCwccxZoJp724BxIKBHcHMZx/UMP4mQDuk=
X-Google-Smtp-Source: AOwi7QDfomldd4RqRtL+9QUrEYaxWWRAROH2a6xOedl4w8+RWFlYWkox6qPhRKzlqzVus7KBHVriCY7AFLZhSzKy8pI=
X-Received: by 10.233.232.8 with SMTP id a8mr4565405qkg.265.1505873727968;
	Tue, 19 Sep 2017 19:15:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.148.104 with HTTP; Tue, 19 Sep 2017 19:15:27 -0700 (PDT)
In-Reply-To: <CACrgode37rm7OnYgk1fLoJVHP1h0r3s_GUdwrpeOuKZnekfnaw@mail.gmail.com>
References: <CACrgode37rm7OnYgk1fLoJVHP1h0r3s_GUdwrpeOuKZnekfnaw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 19 Sep 2017 22:15:27 -0400
Message-ID: <CADkTA4PtpJV3uBra68_7A3KZY_CzmzP=DXUn8-8d3vE1SvROhw@mail.gmail.com>
To: Lai Eddy <eddy.lai.tw@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services] meta-cloud-services Dependencies
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
X-List-Received-Date: Wed, 20 Sep 2017 02:15:29 -0000
Content-Type: multipart/alternative; boundary="94eb2c034350a1dfa90559958ced"

--94eb2c034350a1dfa90559958ced
Content-Type: text/plain; charset="UTF-8"

Clearly the README is out of date (and wrong).

That should be oe-core: git://git.openembedded.org/openembedded-core

Plus that isn't nearly the only layer dependency

I'll have a look at what has gone wrong and update the README.

Bruce

On Tue, Sep 19, 2017 at 8:23 PM, Lai Eddy <eddy.lai.tw@gmail.com> wrote:

> according to layer README
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-cloud-services/about/
> it said
>
> This layer depends on:
>
> URI: git://github.com/openembedded/oe-core.git
>
> but seems failed to clone from that URL
> should that be
> git://github.com/openembedded/meta-openembedded.git
> or other repo available?
>
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

--94eb2c034350a1dfa90559958ced
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Clearly the README is out of date (and wrong).<div><br></d=
iv><div>That should be oe-core: git://<a href=3D"http://git.openembedded.or=
g/openembedded-core">git.openembedded.org/openembedded-core</a></div><div><=
br></div><div>Plus that isn&#39;t nearly the only layer dependency</div><di=
v><br></div><div>I&#39;ll have a look at what has gone wrong and update the=
 README.</div><div><br></div><div>Bruce<br><div class=3D"gmail_extra"><br><=
div class=3D"gmail_quote">On Tue, Sep 19, 2017 at 8:23 PM, Lai Eddy <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:eddy.lai.tw@gmail.com" target=3D"_blank">e=
ddy.lai.tw@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr">according to layer README<div><a href=
=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-cloud-services/about/" t=
arget=3D"_blank">http://git.yoctoproject.org/<wbr>cgit/cgit.cgi/meta-cloud-=
<wbr>services/about/</a><br></div><div>it said=C2=A0</div><div><pre style=
=3D"color:rgb(255,255,255);font-size:13.3333px;background-color:rgb(51,51,5=
1)">This layer depends on:

URI: git://<a href=3D"http://github.com/openembedded/oe-core.git" target=3D=
"_blank">github.com/openembedded/<wbr>oe-core.git</a></pre></div><div>but s=
eems failed to clone from that URL</div><div>should that be=C2=A0</div><div=
>git://<a href=3D"http://github.com/openembedded/meta-openembedded.git" tar=
get=3D"_blank">github.com/openembedded/<wbr>meta-openembedded.git</a><br></=
div><div>or other repo available?</div><div><br></div></div>
<br>--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
<br></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div cla=
ss=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end&quot;</div>
</div></div></div>

--94eb2c034350a1dfa90559958ced--
