Return-Path: <eddy.lai.tw@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5B7A4E00D16; Mon, 25 Sep 2017 14:26:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,FREEMAIL_REPLY,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (eddy.lai.tw[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.83.53 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  1.0 FREEMAIL_REPLY From and body contain different freemails
Received: from mail-pg0-f53.google.com (mail-pg0-f53.google.com [74.125.83.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B2735E00C89
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Sep 2017 14:26:28 -0700 (PDT)
Received: by mail-pg0-f53.google.com with SMTP id j70so4727168pgc.10
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Sep 2017 14:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EdjgFoVF8Yu/cXVdKPzPyYvT+U3SCnVR3dARHxXVo88=;
	b=aO/pb355lwOQgnJEpdog4tv6Q42xjoQ1KHa44G3pkRZOB8f0CAXb17S9aFxcaZVJi/
	XciqcMkmhEM2uKHkJeprWSjxcE0OQk+ihOFI7a/2VtGLYFWwhJIccQChhCUzitYz4zHN
	CzKJZyWcy+tVWVQVR4RdwRJ/bJQ4xJziz7iiWjBgrn4uFLafYWnWDvEv9+EprT06fxQU
	rrbEMqQWW9qPXqML9NHa/pytGA48mtvcDQIOP6+pRLyLXrNohm7x1JA9fZon5pc/5wPK
	uKhsGBBLQsAq1xT4lrl6YqNFLd1waVuv9vUkrbngNUdlEuzNvkq9HMOjXRTIjIVUjI+B
	9s9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EdjgFoVF8Yu/cXVdKPzPyYvT+U3SCnVR3dARHxXVo88=;
	b=rvNfW/CXSDkMB9KN4XmuXDFL3FopRHZcBnoXkg+exT/byvWa9sK2qbDNPjiKHLGmv4
	4TFD0Wve2YQc4WSvcjp3NL/jwHnwiA8RGDY3Tpuvjltke44EL1wNf8E98jzHrENFFZqP
	tjo7Mb20+IoSb9sqsq66qdbMyTBrLyvm2IavXoDShnCSo0fSTGkODeAKTGA+dNIbREvR
	HhS/Tp9Cx3Egg+MpWtgLTjVfYH2ZutiwddUgOBeXAOEC3DQCv9EJw5OlrzuFub+TWNYX
	rBI4UxeoLWtmIMhVDQFulDajOy62N/nXTQDCnfb9k04ZF8k8s7RfwmAqG2HlzviHzRFV
	GByQ==
X-Gm-Message-State: AHPjjUiadEfepjr7EQ6Urtnk4U6t712di+26iotRC3dCWesQ0YFHgKbX
	XXazAH45FccDwHaZreSQYxlXDXF3q/SegzaAVYfByQ==
X-Google-Smtp-Source: AOwi7QAHIxsU/lT3SneXOnX7mZDtiltLeyqD4rEaZ1xeMKUPKg8A/32lFX+dhxDagTqGN20McHEBhH4nMJxZTbQFwfM=
X-Received: by 10.84.211.79 with SMTP id b73mr7308148pli.214.1506374787428;
	Mon, 25 Sep 2017 14:26:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.130.151 with HTTP; Mon, 25 Sep 2017 14:26:26 -0700 (PDT)
In-Reply-To: <CADkTA4OzLagWJdr1Dwqs8Yx9eCFF=qva7z-O+izZ76cYXvz3RA@mail.gmail.com>
References: <CACrgode37rm7OnYgk1fLoJVHP1h0r3s_GUdwrpeOuKZnekfnaw@mail.gmail.com>
	<CADkTA4PtpJV3uBra68_7A3KZY_CzmzP=DXUn8-8d3vE1SvROhw@mail.gmail.com>
	<CADkTA4OzLagWJdr1Dwqs8Yx9eCFF=qva7z-O+izZ76cYXvz3RA@mail.gmail.com>
From: Lai Eddy <eddy.lai.tw@gmail.com>
Date: Tue, 26 Sep 2017 05:26:26 +0800
Message-ID: <CACrgodcPs1JqxAvOueJAUPEyRcmW_et-onGS22-SGcQ+7O9PCQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 25 Sep 2017 21:26:29 -0000
Content-Type: multipart/alternative; boundary="94eb2c18f33a1a7568055a0a3696"

--94eb2c18f33a1a7568055a0a3696
Content-Type: text/plain; charset="UTF-8"

after clone the oe-core: git://git.openembedded.org/openembedded-core
there are only 3 folder inside (meta, meta-selftest meta-skeleton)
seems meta-cloud-services need things like meta-networking and meta-python
where can I found them?

(that's why I think the needed dependency is  git://github.com/openembedded/
meta-openembedded.git )

2017-09-20 10:28 GMT+08:00 Bruce Ashfield <bruce.ashfield@gmail.com>:

>
>
> On Tue, Sep 19, 2017 at 10:15 PM, Bruce Ashfield <bruce.ashfield@gmail.com
> > wrote:
>
>> Clearly the README is out of date (and wrong).
>>
>> That should be oe-core: git://git.openembedded.org/openembedded-core
>>
>> Plus that isn't nearly the only layer dependency
>>
>> I'll have a look at what has gone wrong and update the README.
>>
>
> I pushed a fix for the meta-cloud-services/README, which is mostly empty
> since the
> majority of the packages are actually in the meta-openstack sublayer.
> That layer had
> the same issue with the layer references, so I fixed it as well.
>
> Cheers,
>
> Bruce
>
>
>>
>> Bruce
>>
>> On Tue, Sep 19, 2017 at 8:23 PM, Lai Eddy <eddy.lai.tw@gmail.com> wrote:
>>
>>> according to layer README
>>> http://git.yoctoproject.org/cgit/cgit.cgi/meta-cloud-services/about/
>>> it said
>>>
>>> This layer depends on:
>>>
>>> URI: git://github.com/openembedded/oe-core.git
>>>
>>> but seems failed to clone from that URL
>>> should that be
>>> git://github.com/openembedded/meta-openembedded.git
>>> or other repo available?
>>>
>>>
>>> --
>>> _______________________________________________
>>> meta-virtualization mailing list
>>> meta-virtualization@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>>
>>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
>> at its end"
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>

--94eb2c18f33a1a7568055a0a3696
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">after clone the=C2=A0<span style=3D"color:rgb(80,0,80);fon=
t-size:14px">oe-core: git://</span><a href=3D"http://git.openembedded.org/o=
penembedded-core" target=3D"_blank" style=3D"font-size:14px">git.openembedd=
ed.org/ope<wbr>nembedded-core</a><div>there are only 3 folder inside (meta,=
 meta-selftest meta-skeleton)</div><div>seems meta-cloud-services need thin=
gs like meta-networking and meta-python</div><div>where can I found them?</=
div><div><br></div><div>(that&#39;s why I think the needed dependency is=C2=
=A0=C2=A0<span style=3D"font-size:14px">git://</span><a href=3D"http://gith=
ub.com/openembedded/meta-openembedded.git" target=3D"_blank" style=3D"font-=
size:14px">github.com/openembedded/<wbr>meta-openembedded.git</a>=C2=A0)</d=
iv></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">2017-09-=
20 10:28 GMT+08:00 Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:b=
ruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;=
</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><br><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote"><span class=3D"">On Tue, Se=
p 19, 2017 at 10:15 PM, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Clea=
rly the README is out of date (and wrong).<div><br></div><div>That should b=
e oe-core: git://<a href=3D"http://git.openembedded.org/openembedded-core" =
target=3D"_blank">git.openembedded.org/ope<wbr>nembedded-core</a></div><div=
><br></div><div>Plus that isn&#39;t nearly the only layer dependency</div><=
div><br></div><div>I&#39;ll have a look at what has gone wrong and update t=
he README.</div></div></blockquote><div><br></div></span><div>I pushed a fi=
x for the meta-cloud-services/README, which is mostly empty since the</div>=
<div>majority of the packages are actually in the meta-openstack sublayer.=
=C2=A0 That layer had</div><div>the same issue with the layer references, s=
o I fixed it as well.</div><div><br></div><div>Cheers,</div><div><br></div>=
<div>Bruce</div><span class=3D""><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div dir=3D"ltr"><div><br></div><div>Bruce<br><div class=3D"gmail_ext=
ra"><br><div class=3D"gmail_quote"><div><div class=3D"m_3949208686174381893=
h5">On Tue, Sep 19, 2017 at 8:23 PM, Lai Eddy <span dir=3D"ltr">&lt;<a href=
=3D"mailto:eddy.lai.tw@gmail.com" target=3D"_blank">eddy.lai.tw@gmail.com</=
a>&gt;</span> wrote:<br></div></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div><div class=3D"m_3949208686174381893h5"><div dir=3D"ltr">acc=
ording to layer README<div><a href=3D"http://git.yoctoproject.org/cgit/cgit=
.cgi/meta-cloud-services/about/" target=3D"_blank">http://git.yoctoproject.=
org/cg<wbr>it/cgit.cgi/meta-cloud-service<wbr>s/about/</a><br></div><div>it=
 said=C2=A0</div><div><pre style=3D"color:rgb(255,255,255);font-size:13.333=
3px;background-color:rgb(51,51,51)">This layer depends on:

URI: git://<a href=3D"http://github.com/openembedded/oe-core.git" target=3D=
"_blank">github.com/openembedded/<wbr>oe-core.git</a></pre></div><div>but s=
eems failed to clone from that URL</div><div>should that be=C2=A0</div><div=
>git://<a href=3D"http://github.com/openembedded/meta-openembedded.git" tar=
get=3D"_blank">github.com/openembedded/<wbr>meta-openembedded.git</a><br></=
div><div>or other repo available?</div><div><br></div></div>
<br></div></div><span class=3D"m_3949208686174381893HOEnZb"><font color=3D"=
#888888">--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproje<wbr>ct.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org<wbr>/listi=
nfo/meta-virtualization</a><br>
<br></font></span></blockquote></div><span class=3D"m_3949208686174381893HO=
EnZb"><font color=3D"#888888"><br><br clear=3D"all"><div><br></div>-- <br><=
div class=3D"m_3949208686174381893m_-8519197469124554435gmail_signature">&q=
uot;Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end&quot;</div>
</font></span></div></div></div>
</blockquote></span></div><span class=3D""><br><br clear=3D"all"><div><br><=
/div>-- <br><div class=3D"m_3949208686174381893gmail_signature" data-smartm=
ail=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end&quot;</div>
</span></div></div>
</blockquote></div><br></div>

--94eb2c18f33a1a7568055a0a3696--
