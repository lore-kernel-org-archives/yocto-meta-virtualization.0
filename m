Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 06638E00C89; Mon, 25 Sep 2017 17:08:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, 
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.182 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.182 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5AC76E00C89
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Sep 2017 17:07:58 -0700 (PDT)
Received: by mail-qt0-f182.google.com with SMTP id o52so8726432qtc.9
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Sep 2017 17:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QRj3AVMLUjqgSayLhx1hiUXGcWrcJGJ28Op7DadYAJY=;
	b=Jz6XrC/NhUZDy3X6ELaA+kXkVc89bjEC27kTGC4fCSNT60CGhOgCEVcTKHq7nd9pGi
	+N/PFNH22hzUjy9ZcGxlnn8FZAqjhyn4dB5wToLd/cvXdteZOhvzqw6C3VNCdGQ0KiOa
	ueqycPW1owOZmojWBC+bE3JnFcVfG2QDRVxBLMKrHU5TY4PVaDHYo4XpIHR1cqKHMV0F
	GbsNvzBAWz9QQsj75HO2jRmIeXqBVpqwW2qNcFvQTqd1qWkD0zpzDScpgJ56VaBw4BEO
	9Q3H4x5ICw0cBXjytHUvT0R06CpBTSYbEHV6N0+cQRIn7d4uayjQ0xc7XQC7eI24r14a
	2T9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QRj3AVMLUjqgSayLhx1hiUXGcWrcJGJ28Op7DadYAJY=;
	b=nnrcZlbm7BDQ1rWGcNzCZSeNeceNEeCkCQeZnNgbfDHlxIsoFIISYv8OhC/I6mVKUa
	vBB004BU5boyy9i037xnhHr+8e7tTrrhi2oC7D61StaoGoHzGkjhpMdcLAQbuCqeP2Ja
	z2jWMCvgRG3iinQGuS9Vg3psldm/1Elez2yZLST1XILUks9cYl6faDs9rB7KO2W/RpuS
	FMDbRdfrh9C41RexjPdT4XfTFE6fhbTS+iRwM5RO4jRVr0nnsY1CHofOhoa61P/bFtt0
	FNCeeISG4sPHT4AxTY/9k8yVYY6w/VR1bHtFseSHcI5P/1aqybX0/++yta3YAcrN5rGE
	t4Wg==
X-Gm-Message-State: AHPjjUgawlLEPrD8wmGtzw3/Bd+cPITahQKyKwGv94fogirHHPmqLJw6
	7bW7/B+Lch24I6XAkWlP6f+BhGukbXs7k8RkNY8=
X-Google-Smtp-Source: AOwi7QCOJE+Wh6RsnP7/vmwj5Q2ntw1fOiOg1eaO09vEA6iU2eNjc49hZCZ9nqVXumkaCrltwkk9dwzfHkBV3CpO5NM=
X-Received: by 10.200.51.69 with SMTP id u5mr13750286qta.204.1506384478398;
	Mon, 25 Sep 2017 17:07:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.148.104 with HTTP; Mon, 25 Sep 2017 17:07:57 -0700 (PDT)
In-Reply-To: <CACrgodcPs1JqxAvOueJAUPEyRcmW_et-onGS22-SGcQ+7O9PCQ@mail.gmail.com>
References: <CACrgode37rm7OnYgk1fLoJVHP1h0r3s_GUdwrpeOuKZnekfnaw@mail.gmail.com>
	<CADkTA4PtpJV3uBra68_7A3KZY_CzmzP=DXUn8-8d3vE1SvROhw@mail.gmail.com>
	<CADkTA4OzLagWJdr1Dwqs8Yx9eCFF=qva7z-O+izZ76cYXvz3RA@mail.gmail.com>
	<CACrgodcPs1JqxAvOueJAUPEyRcmW_et-onGS22-SGcQ+7O9PCQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 25 Sep 2017 20:07:57 -0400
Message-ID: <CADkTA4MLfyXNEZg5ifOeK5TEep0hBDMd79iFa0k=N1WKP-Txiw@mail.gmail.com>
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
X-List-Received-Date: Tue, 26 Sep 2017 00:08:00 -0000
Content-Type: multipart/alternative; boundary="001a11434264baed50055a0c7745"

--001a11434264baed50055a0c7745
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 25, 2017 at 5:26 PM, Lai Eddy <eddy.lai.tw@gmail.com> wrote:

> after clone the oe-core: git://git.openembedded.org/openembedded-core
> there are only 3 folder inside (meta, meta-selftest meta-skeleton)
> seems meta-cloud-services need things like meta-networking and meta-python
> where can I found them?
>
> (that's why I think the needed dependency is  git://github.com/
> openembedded/meta-openembedded.git )
>

They are sublayers of that repo, the single clone gets you all the layers
you need, but
you do need to add them to your bblayers.conf file as they sit in the clone.

Bruce


>
> 2017-09-20 10:28 GMT+08:00 Bruce Ashfield <bruce.ashfield@gmail.com>:
>
>>
>>
>> On Tue, Sep 19, 2017 at 10:15 PM, Bruce Ashfield <
>> bruce.ashfield@gmail.com> wrote:
>>
>>> Clearly the README is out of date (and wrong).
>>>
>>> That should be oe-core: git://git.openembedded.org/openembedded-core
>>>
>>> Plus that isn't nearly the only layer dependency
>>>
>>> I'll have a look at what has gone wrong and update the README.
>>>
>>
>> I pushed a fix for the meta-cloud-services/README, which is mostly empty
>> since the
>> majority of the packages are actually in the meta-openstack sublayer.
>> That layer had
>> the same issue with the layer references, so I fixed it as well.
>>
>> Cheers,
>>
>> Bruce
>>
>>
>>>
>>> Bruce
>>>
>>> On Tue, Sep 19, 2017 at 8:23 PM, Lai Eddy <eddy.lai.tw@gmail.com> wrote:
>>>
>>>> according to layer README
>>>> http://git.yoctoproject.org/cgit/cgit.cgi/meta-cloud-services/about/
>>>> it said
>>>>
>>>> This layer depends on:
>>>>
>>>> URI: git://github.com/openembedded/oe-core.git
>>>>
>>>> but seems failed to clone from that URL
>>>> should that be
>>>> git://github.com/openembedded/meta-openembedded.git
>>>> or other repo available?
>>>>
>>>>
>>>> --
>>>> _______________________________________________
>>>> meta-virtualization mailing list
>>>> meta-virtualization@yoctoproject.org
>>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>>>
>>>>
>>>
>>>
>>> --
>>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end"
>>>
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
>> at its end"
>>
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11434264baed50055a0c7745
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Sep 25, 2017 at 5:26 PM, Lai Eddy <span dir=3D"ltr">&lt;<a href=
=3D"mailto:eddy.lai.tw@gmail.com" target=3D"_blank">eddy.lai.tw@gmail.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">aft=
er clone the=C2=A0<span style=3D"color:rgb(80,0,80);font-size:14px">oe-core=
: git://</span><a href=3D"http://git.openembedded.org/openembedded-core" st=
yle=3D"font-size:14px" target=3D"_blank">git.openembedded.org/ope<wbr>nembe=
dded-core</a><div>there are only 3 folder inside (meta, meta-selftest meta-=
skeleton)</div><div>seems meta-cloud-services need things like meta-network=
ing and meta-python</div><div>where can I found them?</div><div><br></div><=
div>(that&#39;s why I think the needed dependency is=C2=A0=C2=A0<span style=
=3D"font-size:14px">git://</span><a href=3D"http://github.com/openembedded/=
meta-openembedded.git" style=3D"font-size:14px" target=3D"_blank">github.co=
m/<wbr>openembedded/meta-<wbr>openembedded.git</a>=C2=A0)</div></div></bloc=
kquote><div><br></div><div>They are sublayers of that repo, the single clon=
e gets you all the layers you need, but</div><div>you do need to add them t=
o your bblayers.conf file as they sit in the clone.</div><div><br></div><di=
v>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote"><span class=3D"">2017-09-20 10:=
28 GMT+08:00 Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.a=
shfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span=
>:<br></span><div><div class=3D"h5"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><spa=
n>On Tue, Sep 19, 2017 at 10:15 PM, Bruce Ashfield <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@=
gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr">Clearly the README is out of date (and wrong).<div><br></div><div>=
That should be oe-core: git://<a href=3D"http://git.openembedded.org/openem=
bedded-core" target=3D"_blank">git.openembedded.org/ope<wbr>nembedded-core<=
/a></div><div><br></div><div>Plus that isn&#39;t nearly the only layer depe=
ndency</div><div><br></div><div>I&#39;ll have a look at what has gone wrong=
 and update the README.</div></div></blockquote><div><br></div></span><div>=
I pushed a fix for the meta-cloud-services/README, which is mostly empty si=
nce the</div><div>majority of the packages are actually in the meta-opensta=
ck sublayer.=C2=A0 That layer had</div><div>the same issue with the layer r=
eferences, so I fixed it as well.</div><div><br></div><div>Cheers,</div><di=
v><br></div><div>Bruce</div><span><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><div dir=3D"ltr"><div><br></div><div>Bruce<br><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote"><div><div class=3D"m_-37278445524550738=
09m_3949208686174381893h5">On Tue, Sep 19, 2017 at 8:23 PM, Lai Eddy <span =
dir=3D"ltr">&lt;<a href=3D"mailto:eddy.lai.tw@gmail.com" target=3D"_blank">=
eddy.lai.tw@gmail.com</a>&gt;</span> wrote:<br></div></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div><div class=3D"m_-3727844552455073809=
m_3949208686174381893h5"><div dir=3D"ltr">according to layer README<div><a =
href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-cloud-services/about=
/" target=3D"_blank">http://git.yoctoproject.org/cg<wbr>it/cgit.cgi/meta-cl=
oud-service<wbr>s/about/</a><br></div><div>it said=C2=A0</div><div><pre sty=
le=3D"color:rgb(255,255,255);font-size:13.3333px;background-color:rgb(51,51=
,51)">This layer depends on:

URI: git://<a href=3D"http://github.com/openembedded/oe-core.git" target=3D=
"_blank">github.com/openembedded/<wbr>oe-core.git</a></pre></div><div>but s=
eems failed to clone from that URL</div><div>should that be=C2=A0</div><div=
>git://<a href=3D"http://github.com/openembedded/meta-openembedded.git" tar=
get=3D"_blank">github.com/openembedded/<wbr>meta-openembedded.git</a><br></=
div><div>or other repo available?</div><div><br></div></div>
<br></div></div><span class=3D"m_-3727844552455073809m_3949208686174381893H=
OEnZb"><font color=3D"#888888">--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproje<wbr>ct.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org<wbr>/listi=
nfo/meta-virtualization</a><br>
<br></font></span></blockquote></div><span class=3D"m_-3727844552455073809m=
_3949208686174381893HOEnZb"><font color=3D"#888888"><br><br clear=3D"all"><=
div><br></div>-- <br><div class=3D"m_-3727844552455073809m_3949208686174381=
893m_-8519197469124554435gmail_signature">&quot;Thou shalt not follow the N=
ULL pointer, for chaos and madness await thee at its end&quot;</div>
</font></span></div></div></div>
</blockquote></span></div><span><br><br clear=3D"all"><div><br></div>-- <br=
><div class=3D"m_-3727844552455073809m_3949208686174381893gmail_signature" =
data-smartmail=3D"gmail_signature">&quot;Thou shalt not follow the NULL poi=
nter, for chaos and madness await thee at its end&quot;</div>
</span></div></div>
</blockquote></div></div></div><br></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--001a11434264baed50055a0c7745--
