Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D9F46E00CD4; Tue, 19 Sep 2017 19:28:55 -0700 (PDT)
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
	*      [209.85.220.174 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.174 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7865CE00CD3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Sep 2017 19:28:55 -0700 (PDT)
Received: by mail-qk0-f174.google.com with SMTP id t184so1449798qke.10
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Sep 2017 19:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=o5oVvSvWZixpo2Vw0mThPT92pm6gwPY5qllHOfjlm94=;
	b=gC7H1j7wgIX+qPcS6mjU3GGKgM83ztELX3W5682Ue7AfDn9hkocS/vlLQUKpPzOrab
	Xky8UiIBGvb8mts+SRwupZqsPhOhmuxVoYJ6sa+N2boc//D2k1RtgJSgeK94J2neHQ87
	e6wpyEvZWoNPAgA23S9Z0DL26iMasX3lknibefp34FqyGWy/FWpvGnryT8n4YRYowBXd
	7uqJeKeVxU8kyW1gmwTA/SfSI9h8BtK9VITmlhzU8fqY6lH4vi6n1aspQlxrBQJtH6+Q
	NmMEfk/DeBw9XPqjSjH+18cXwNet8JRymi5Iaw9jblOnJ4jtswp9PujIgHpDGMCo29Tx
	LA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=o5oVvSvWZixpo2Vw0mThPT92pm6gwPY5qllHOfjlm94=;
	b=HaH4Ok0e3PyhEyXzUnYucLISM7wxwqL6HnJpqWHutxpoAccbXzeE18hWPa2AelRc+w
	dQluosaxBT66P2pQ87FZ+HMXPCtomskS5ohZrzqeFStDrY9GbcDEMuVN55gXIdQn6ssb
	mGdWN+6Uy1fvrM0GGNXKqvnYCjNzAtDRz/6a5q2T7ki9+eS7feMLEvmOVXsW3n3lUvBb
	+mGqVxjw2n4KAR1eHBtdefMtPUjcdyhkymnc4yM6nZfW7enthgm3HkDfzjRFHLteJ9ct
	9WMlTHcjrwC8FotfWG0aEbYj5eUkbTa1FzLMez6x0zEmGfDu/rJQTn9YETC7Ty7TZbif
	ahXw==
X-Gm-Message-State: AHPjjUgKYpR49LlQ4qLHdtquoA/DPrqDj0vrobPF2Ctg8dGxB6a27PCI
	/2YfWa1rIQOZFA5B1qNZ9rtcG6mpLUZzLgGHlWg=
X-Google-Smtp-Source: AOwi7QD5WV5SvAb+gxzFCljzpyJhEqbApe1vbY2u4PbvylLsIChkPfNRJXhA6P3CNa+2EtXPbDsdo2xzs94KRqEIbM4=
X-Received: by 10.55.142.70 with SMTP id q67mr4303329qkd.103.1505874534527;
	Tue, 19 Sep 2017 19:28:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.148.104 with HTTP; Tue, 19 Sep 2017 19:28:53 -0700 (PDT)
In-Reply-To: <CADkTA4PtpJV3uBra68_7A3KZY_CzmzP=DXUn8-8d3vE1SvROhw@mail.gmail.com>
References: <CACrgode37rm7OnYgk1fLoJVHP1h0r3s_GUdwrpeOuKZnekfnaw@mail.gmail.com>
	<CADkTA4PtpJV3uBra68_7A3KZY_CzmzP=DXUn8-8d3vE1SvROhw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 19 Sep 2017 22:28:53 -0400
Message-ID: <CADkTA4OzLagWJdr1Dwqs8Yx9eCFF=qva7z-O+izZ76cYXvz3RA@mail.gmail.com>
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
X-List-Received-Date: Wed, 20 Sep 2017 02:28:55 -0000
Content-Type: multipart/alternative; boundary="94eb2c083c8cb4f927055995bc60"

--94eb2c083c8cb4f927055995bc60
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 19, 2017 at 10:15 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> Clearly the README is out of date (and wrong).
>
> That should be oe-core: git://git.openembedded.org/openembedded-core
>
> Plus that isn't nearly the only layer dependency
>
> I'll have a look at what has gone wrong and update the README.
>

I pushed a fix for the meta-cloud-services/README, which is mostly empty
since the
majority of the packages are actually in the meta-openstack sublayer.  That
layer had
the same issue with the layer references, so I fixed it as well.

Cheers,

Bruce


>
> Bruce
>
> On Tue, Sep 19, 2017 at 8:23 PM, Lai Eddy <eddy.lai.tw@gmail.com> wrote:
>
>> according to layer README
>> http://git.yoctoproject.org/cgit/cgit.cgi/meta-cloud-services/about/
>> it said
>>
>> This layer depends on:
>>
>> URI: git://github.com/openembedded/oe-core.git
>>
>> but seems failed to clone from that URL
>> should that be
>> git://github.com/openembedded/meta-openembedded.git
>> or other repo available?
>>
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
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

--94eb2c083c8cb4f927055995bc60
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Sep 19, 2017 at 10:15 PM, Bruce Ashfield <span dir=3D"ltr">&lt;=
<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfiel=
d@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div di=
r=3D"ltr">Clearly the README is out of date (and wrong).<div><br></div><div=
>That should be oe-core: git://<a href=3D"http://git.openembedded.org/opene=
mbedded-core" target=3D"_blank">git.openembedded.org/<wbr>openembedded-core=
</a></div><div><br></div><div>Plus that isn&#39;t nearly the only layer dep=
endency</div><div><br></div><div>I&#39;ll have a look at what has gone wron=
g and update the README.</div></div></blockquote><div><br></div><div>I push=
ed a fix for the meta-cloud-services/README, which is mostly empty since th=
e</div><div>majority of the packages are actually in the meta-openstack sub=
layer.=C2=A0 That layer had</div><div>the same issue with the layer referen=
ces, so I fixed it as well.</div><div><br></div><div>Cheers,</div><div><br>=
</div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
dir=3D"ltr"><div><br></div><div>Bruce<br><div class=3D"gmail_extra"><br><di=
v class=3D"gmail_quote"><div><div class=3D"h5">On Tue, Sep 19, 2017 at 8:23=
 PM, Lai Eddy <span dir=3D"ltr">&lt;<a href=3D"mailto:eddy.lai.tw@gmail.com=
" target=3D"_blank">eddy.lai.tw@gmail.com</a>&gt;</span> wrote:<br></div></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div class=3D"h5=
"><div dir=3D"ltr">according to layer README<div><a href=3D"http://git.yoct=
oproject.org/cgit/cgit.cgi/meta-cloud-services/about/" target=3D"_blank">ht=
tp://git.yoctoproject.org/cg<wbr>it/cgit.cgi/meta-cloud-service<wbr>s/about=
/</a><br></div><div>it said=C2=A0</div><div><pre style=3D"color:rgb(255,255=
,255);font-size:13.3333px;background-color:rgb(51,51,51)">This layer depend=
s on:

URI: git://<a href=3D"http://github.com/openembedded/oe-core.git" target=3D=
"_blank">github.com/openembedded/<wbr>oe-core.git</a></pre></div><div>but s=
eems failed to clone from that URL</div><div>should that be=C2=A0</div><div=
>git://<a href=3D"http://github.com/openembedded/meta-openembedded.git" tar=
get=3D"_blank">github.com/openembedded/<wbr>meta-openembedded.git</a><br></=
div><div>or other repo available?</div><div><br></div></div>
<br></div></div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproje<wbr>ct.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org<wbr>/listi=
nfo/meta-virtualization</a><br>
<br></font></span></blockquote></div><span class=3D"HOEnZb"><font color=3D"=
#888888"><br><br clear=3D"all"><div><br></div>-- <br><div class=3D"m_-85191=
97469124554435gmail_signature">&quot;Thou shalt not follow the NULL pointer=
, for chaos and madness await thee at its end&quot;</div>
</font></span></div></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--94eb2c083c8cb4f927055995bc60--
