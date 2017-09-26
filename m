Return-Path: <eddy.lai.tw@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 66DE4E00D18; Mon, 25 Sep 2017 17:16:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (eddy.lai.tw[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.192.169 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 80594E00C89
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Sep 2017 17:16:36 -0700 (PDT)
Received: by mail-pf0-f169.google.com with SMTP id l188so4660926pfc.6
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Sep 2017 17:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KDdIBvfM8F4oCFulNzwQg6YzmRPgq7KWKK2yX00rU10=;
	b=golnIkhb3NUxakwV5P9VcStae6bs/o8UgGM5kII/wb1DqBRX7dYwLAipPWtTZDFuRC
	O2qIKToqCFekgTFNb6iFRWlszFDei4PrQWEPWcnhQGJaSg9ktLC28p4zl8FMNleos+pa
	TPW8n2MtbXGSJIMU4il6S8vnj96bEmZ2Sz9aMJ+I36J2k+mcatpe0zX4gUDBWmrF5O8k
	xBJUAhdPaSSa5G1uwyyqoQGZsiO1DLaaxq3d+lgQy27Zn00k+K7pe5eV01Xw2q4/4sKs
	N0AOpMPHolGn1VPVXyERCSMzBjDKT39eUdrq3zKfMz5YCNQQvb7cuxOuN+AwfoPt4Mu4
	SrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KDdIBvfM8F4oCFulNzwQg6YzmRPgq7KWKK2yX00rU10=;
	b=S5Qv4ahEJCDjfNz9yB3GgLG7N4sdlen117oQx4SQykdJM4D/3mHmxz8S8PuVfnH1yZ
	UxpU3kK2QHKKZtyR655jdDoNCMKXpo8uWVqRVMYTymF32GccoAGMhm46360aFIJIin5Z
	QjWe1XwBUTZd7AteP/a1YCezCKBtpdFIyBomiooEh76Qycd48DkUFCnqdWy47V9DY9mC
	vnUM8YNk12WT0HkhtRa0n1UmB1zTioKjIW05pTTIUMr+5BrWwTo9PSAOSX7nVTgIAhRS
	Oeugchz1eGSoVrHa7htOL/GL8Fk7oAGW5NUo6LHLnRiTg5i1uF6XXGC2df34GJj0kJ43
	jwgA==
X-Gm-Message-State: AHPjjUjppq4NOjExtxivhaJyq175/dzxQkCWEUMFgbNCw46Mcx9U56wT
	ZIYUMBQL0HNz41DC5Ma4LEOPsp0fFkI23kgljIg=
X-Google-Smtp-Source: AOwi7QAnj/zSsSrgtaQuk/bPJUNYX+E2Dw5VgYvSrvrvfxm5m/y5ELjmqqZsETYCzqc0l0/fupl1jsnQR1NBCTmzi3E=
X-Received: by 10.101.69.8 with SMTP id n8mr9237227pgq.167.1506384996434; Mon,
	25 Sep 2017 17:16:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.130.151 with HTTP; Mon, 25 Sep 2017 17:16:36 -0700 (PDT)
In-Reply-To: <CADkTA4MLfyXNEZg5ifOeK5TEep0hBDMd79iFa0k=N1WKP-Txiw@mail.gmail.com>
References: <CACrgode37rm7OnYgk1fLoJVHP1h0r3s_GUdwrpeOuKZnekfnaw@mail.gmail.com>
	<CADkTA4PtpJV3uBra68_7A3KZY_CzmzP=DXUn8-8d3vE1SvROhw@mail.gmail.com>
	<CADkTA4OzLagWJdr1Dwqs8Yx9eCFF=qva7z-O+izZ76cYXvz3RA@mail.gmail.com>
	<CACrgodcPs1JqxAvOueJAUPEyRcmW_et-onGS22-SGcQ+7O9PCQ@mail.gmail.com>
	<CADkTA4MLfyXNEZg5ifOeK5TEep0hBDMd79iFa0k=N1WKP-Txiw@mail.gmail.com>
From: Lai Eddy <eddy.lai.tw@gmail.com>
Date: Tue, 26 Sep 2017 08:16:36 +0800
Message-ID: <CACrgodeqimG6u8tg0iTMyBUu2zU-Ua615fh5y+e1iBap5qg_fw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
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
X-List-Received-Date: Tue, 26 Sep 2017 00:16:38 -0000
Content-Type: multipart/alternative; boundary="089e0826dc5c9b89a2055a0c9606"

--089e0826dc5c9b89a2055a0c9606
Content-Type: text/plain; charset="UTF-8"

Thanks Bruce,

but I still don't understand,now I have following in my bblayrs.conf

BBLAYERS ?= " \
  /home/user/poky/meta \
  /home/user/poky/meta-poky \
  /home/user/poky/meta-yocto-bsp \
  /home/user/poky/open-embedded-core/meta \
  /home/user/poky/meta-cloud-services \
  /home/user/poky/meta-cloud-services/meta-openstack \
  /home/user/poky/meta-intel \
"
anything else I should add?

2017-09-26 8:07 GMT+08:00 Bruce Ashfield <bruce.ashfield@gmail.com>:

>
>
> On Mon, Sep 25, 2017 at 5:26 PM, Lai Eddy <eddy.lai.tw@gmail.com> wrote:
>
>> after clone the oe-core: git://git.openembedded.org/openembedded-core
>> there are only 3 folder inside (meta, meta-selftest meta-skeleton)
>> seems meta-cloud-services need things like meta-networking and meta-python
>> where can I found them?
>>
>> (that's why I think the needed dependency is  git://github.com/openembed
>> ded/meta-openembedded.git )
>>
>
> They are sublayers of that repo, the single clone gets you all the layers
> you need, but
> you do need to add them to your bblayers.conf file as they sit in the
> clone.
>
> Bruce
>
>
>>
>> 2017-09-20 10:28 GMT+08:00 Bruce Ashfield <bruce.ashfield@gmail.com>:
>>
>>>
>>>
>>> On Tue, Sep 19, 2017 at 10:15 PM, Bruce Ashfield <
>>> bruce.ashfield@gmail.com> wrote:
>>>
>>>> Clearly the README is out of date (and wrong).
>>>>
>>>> That should be oe-core: git://git.openembedded.org/openembedded-core
>>>>
>>>> Plus that isn't nearly the only layer dependency
>>>>
>>>> I'll have a look at what has gone wrong and update the README.
>>>>
>>>
>>> I pushed a fix for the meta-cloud-services/README, which is mostly empty
>>> since the
>>> majority of the packages are actually in the meta-openstack sublayer.
>>> That layer had
>>> the same issue with the layer references, so I fixed it as well.
>>>
>>> Cheers,
>>>
>>> Bruce
>>>
>>>
>>>>
>>>> Bruce
>>>>
>>>> On Tue, Sep 19, 2017 at 8:23 PM, Lai Eddy <eddy.lai.tw@gmail.com>
>>>> wrote:
>>>>
>>>>> according to layer README
>>>>> http://git.yoctoproject.org/cgit/cgit.cgi/meta-cloud-services/about/
>>>>> it said
>>>>>
>>>>> This layer depends on:
>>>>>
>>>>> URI: git://github.com/openembedded/oe-core.git
>>>>>
>>>>> but seems failed to clone from that URL
>>>>> should that be
>>>>> git://github.com/openembedded/meta-openembedded.git
>>>>> or other repo available?
>>>>>
>>>>>
>>>>> --
>>>>> _______________________________________________
>>>>> meta-virtualization mailing list
>>>>> meta-virtualization@yoctoproject.org
>>>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>>>>
>>>>>
>>>>
>>>>
>>>> --
>>>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>>>> thee at its end"
>>>>
>>>
>>>
>>>
>>> --
>>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end"
>>>
>>
>>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>

--089e0826dc5c9b89a2055a0c9606
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Bruce,<div><br></div><div>but I still don&#39;t und=
erstand,now I have following in my bblayrs.conf</div><div><br></div><div><d=
iv>BBLAYERS ?=3D &quot; \</div><div>=C2=A0 /home/user/poky/meta \</div><div=
>=C2=A0 /home/user/poky/meta-poky \</div><div>=C2=A0 /home/user/poky/meta-y=
octo-bsp \</div><div>=C2=A0 /home/user/poky/open-embedded-core/meta \</div>=
<div>=C2=A0 /home/user/poky/meta-cloud-services \</div><div>=C2=A0 /home/us=
er/poky/meta-cloud-services/meta-openstack \</div><div>=C2=A0 /home/user/po=
ky/meta-intel \</div></div><div>&quot;</div><div>anything else I should add=
?<br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
2017-09-26 8:07 GMT+08:00 Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com<=
/a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><br><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote"><span class=3D"">On M=
on, Sep 25, 2017 at 5:26 PM, Lai Eddy <span dir=3D"ltr">&lt;<a href=3D"mail=
to:eddy.lai.tw@gmail.com" target=3D"_blank">eddy.lai.tw@gmail.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">after clone=
 the=C2=A0<span style=3D"color:rgb(80,0,80);font-size:14px">oe-core: git://=
</span><a href=3D"http://git.openembedded.org/openembedded-core" style=3D"f=
ont-size:14px" target=3D"_blank">git.openembedded.org/ope<wbr>nembedded-cor=
e</a><div>there are only 3 folder inside (meta, meta-selftest meta-skeleton=
)</div><div>seems meta-cloud-services need things like meta-networking and =
meta-python</div><div>where can I found them?</div><div><br></div><div>(tha=
t&#39;s why I think the needed dependency is=C2=A0=C2=A0<span style=3D"font=
-size:14px">git://</span><a href=3D"http://github.com/openembedded/meta-ope=
nembedded.git" style=3D"font-size:14px" target=3D"_blank">github.com/openem=
bed<wbr>ded/meta-openembedded.git</a>=C2=A0)</div></div></blockquote><div><=
br></div></span><div>They are sublayers of that repo, the single clone gets=
 you all the layers you need, but</div><div>you do need to add them to your=
 bblayers.conf file as they sit in the clone.</div><span class=3D"HOEnZb"><=
font color=3D"#888888"><div><br></div><div>Bruce</div></font></span><div><d=
iv class=3D"h5"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote"><span>2017-09-20 10:28 GMT+=
08:00 Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield=
@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span>:<br><=
/span><div><div class=3D"m_-5973678820784871578h5"><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote"><span>On Tue, Sep 19, 2017 at 10:15 PM, Bruce Ashfield <span dir=
=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">=
bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div dir=3D"ltr">Clearly the README is out of date (and wrong).<div><=
br></div><div>That should be oe-core: git://<a href=3D"http://git.openembed=
ded.org/openembedded-core" target=3D"_blank">git.openembedded.org/ope<wbr>n=
embedded-core</a></div><div><br></div><div>Plus that isn&#39;t nearly the o=
nly layer dependency</div><div><br></div><div>I&#39;ll have a look at what =
has gone wrong and update the README.</div></div></blockquote><div><br></di=
v></span><div>I pushed a fix for the meta-cloud-services/README, which is m=
ostly empty since the</div><div>majority of the packages are actually in th=
e meta-openstack sublayer.=C2=A0 That layer had</div><div>the same issue wi=
th the layer references, so I fixed it as well.</div><div><br></div><div>Ch=
eers,</div><div><br></div><div>Bruce</div><span><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><div dir=3D"ltr"><div><br></div><div>Bruce<br><div cla=
ss=3D"gmail_extra"><br><div class=3D"gmail_quote"><div><div class=3D"m_-597=
3678820784871578m_-3727844552455073809m_3949208686174381893h5">On Tue, Sep =
19, 2017 at 8:23 PM, Lai Eddy <span dir=3D"ltr">&lt;<a href=3D"mailto:eddy.=
lai.tw@gmail.com" target=3D"_blank">eddy.lai.tw@gmail.com</a>&gt;</span> wr=
ote:<br></div></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>=
<div class=3D"m_-5973678820784871578m_-3727844552455073809m_394920868617438=
1893h5"><div dir=3D"ltr">according to layer README<div><a href=3D"http://gi=
t.yoctoproject.org/cgit/cgit.cgi/meta-cloud-services/about/" target=3D"_bla=
nk">http://git.yoctoproject.org/cg<wbr>it/cgit.cgi/meta-cloud-service<wbr>s=
/about/</a><br></div><div>it said=C2=A0</div><div><pre style=3D"color:rgb(2=
55,255,255);font-size:13.3333px;background-color:rgb(51,51,51)">This layer =
depends on:

URI: git://<a href=3D"http://github.com/openembedded/oe-core.git" target=3D=
"_blank">github.com/openembedded/<wbr>oe-core.git</a></pre></div><div>but s=
eems failed to clone from that URL</div><div>should that be=C2=A0</div><div=
>git://<a href=3D"http://github.com/openembedded/meta-openembedded.git" tar=
get=3D"_blank">github.com/openembedded/<wbr>meta-openembedded.git</a><br></=
div><div>or other repo available?</div><div><br></div></div>
<br></div></div><span class=3D"m_-5973678820784871578m_-3727844552455073809=
m_3949208686174381893HOEnZb"><font color=3D"#888888">--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproje<wbr>ct.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org<wbr>/listi=
nfo/meta-virtualization</a><br>
<br></font></span></blockquote></div><span class=3D"m_-5973678820784871578m=
_-3727844552455073809m_3949208686174381893HOEnZb"><font color=3D"#888888"><=
br><br clear=3D"all"><div><br></div>-- <br><div class=3D"m_-597367882078487=
1578m_-3727844552455073809m_3949208686174381893m_-8519197469124554435gmail_=
signature">&quot;Thou shalt not follow the NULL pointer, for chaos and madn=
ess await thee at its end&quot;</div>
</font></span></div></div></div>
</blockquote></span></div><span><br><br clear=3D"all"><div><br></div>-- <br=
><div class=3D"m_-5973678820784871578m_-3727844552455073809m_39492086861743=
81893gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</span></div></div>
</blockquote></div></div></div><br></div>
</blockquote></div></div></div><div><div class=3D"h5"><br><br clear=3D"all"=
><div><br></div>-- <br><div class=3D"m_-5973678820784871578gmail_signature"=
 data-smartmail=3D"gmail_signature">&quot;Thou shalt not follow the NULL po=
inter, for chaos and madness await thee at its end&quot;</div>
</div></div></div></div>
</blockquote></div><br></div>

--089e0826dc5c9b89a2055a0c9606--
