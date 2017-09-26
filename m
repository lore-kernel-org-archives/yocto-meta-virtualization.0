Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 02C48E00D13; Tue, 26 Sep 2017 05:21:53 -0700 (PDT)
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
	*      [209.85.220.176 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.176 listed in dnsbl.sorbs.net]
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CAE73E00D10
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Sep 2017 05:21:51 -0700 (PDT)
Received: by mail-qk0-f176.google.com with SMTP id c69so9784611qke.8
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Sep 2017 05:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iaMiZDrP3SxsvBL65kbyzbjVmQR7vG3bLKWeUAn7Cig=;
	b=r/QBE6FwJl7fgKK5+Wfs5uEw4OqkMpbKsAwxnEeHH1YAGbFGBiVAIzU67d0Rwh2zSG
	GEaChgXzRRRvrajoIsquHD9ljBgQacDDerx2CX7vpP1gtD7argYvoagHv7XnSvTEVuBB
	SSectRqZChpDMGv/Z7hwU8ipe/BYri7gEXo0L/6jf5e5BnS54ZqSQYLUpxrEL5hrPJPv
	uFnZVny+lPJiQ6R5kCyoSWNWHnFMKc0qDaz/8ahze5AjzCJYNxzOrh8QVAc3Y3EA21ES
	V+6QVHa2zQslbLHK9P9CVdHDdEKRJccV5aWlLLnt615EQdxcxxJsqvh3HrGj971HcLlb
	Mtaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iaMiZDrP3SxsvBL65kbyzbjVmQR7vG3bLKWeUAn7Cig=;
	b=B544uTmUEGmGPaCGxkib9BFaKEnr4iQ8moRhOkwjFEwJjmgqmOrsXOysRPXrHVNcpz
	yqcsZ17TTMVJMFdZYWQXYLmuOONOWONP8eZ3l65ZZtWqsG74y0PUTU1oLnThCXlgNjic
	rMW9IgorwM/wHcvrkBYscmNrdRSEwX140qIye6TW1PZxxu957eQvvR6CGQvCSkmDbsWZ
	H9QMKNDfe12gycK9CQV/bgcH0cpZXso40tw/ZgueedJ+DQdWRVaeickpsJy8u2Q2lRnj
	/FmcVF8luNnOSlHBiYDdZBLoZSPSOGrWawgUBM787IGaPHnaBF29vMcy5lTV5DB9TAUi
	vv1w==
X-Gm-Message-State: AHPjjUi43wyeg8jXlVqOGqpsqmn2gAC6OlGNChRukjoeffOtK2JPurcS
	vEPmZ+BtDF6M9PTrBzuZp7mSymRbZ4kIoIoR/TtcIg==
X-Google-Smtp-Source: AOwi7QBpya2LajUYJV40aHgjjjRnx9V+WK7xbyhTbSwrVudA+wUAwWNyWi6FVPzmn+8qSEjhCVf4b5W636FrdOShxVo=
X-Received: by 10.55.142.70 with SMTP id q67mr14896470qkd.103.1506428510712;
	Tue, 26 Sep 2017 05:21:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.148.104 with HTTP; Tue, 26 Sep 2017 05:21:50 -0700 (PDT)
In-Reply-To: <CACrgodfeQFn5abG+ThP+gB2tZ0sM81x-CWwVd8C8d+pHCk0rYg@mail.gmail.com>
References: <CACrgode37rm7OnYgk1fLoJVHP1h0r3s_GUdwrpeOuKZnekfnaw@mail.gmail.com>
	<CADkTA4PtpJV3uBra68_7A3KZY_CzmzP=DXUn8-8d3vE1SvROhw@mail.gmail.com>
	<CADkTA4OzLagWJdr1Dwqs8Yx9eCFF=qva7z-O+izZ76cYXvz3RA@mail.gmail.com>
	<CACrgodcPs1JqxAvOueJAUPEyRcmW_et-onGS22-SGcQ+7O9PCQ@mail.gmail.com>
	<CADkTA4MLfyXNEZg5ifOeK5TEep0hBDMd79iFa0k=N1WKP-Txiw@mail.gmail.com>
	<CACrgodeqimG6u8tg0iTMyBUu2zU-Ua615fh5y+e1iBap5qg_fw@mail.gmail.com>
	<CADkTA4OBuR=WWsiHW1r07nboKUtPuZNQBR9dN_uPPfv5zfvBzA@mail.gmail.com>
	<CACrgodfeQFn5abG+ThP+gB2tZ0sM81x-CWwVd8C8d+pHCk0rYg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 26 Sep 2017 08:21:50 -0400
Message-ID: <CADkTA4NvkQs3umNUU6FqoBKQmGqSJ_j4xGR-tgdiCxA=Za-joQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 26 Sep 2017 12:21:53 -0000
Content-Type: multipart/alternative; boundary="94eb2c083c8c42b8ea055a16b821"

--94eb2c083c8c42b8ea055a16b821
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 26, 2017 at 12:45 AM, Lai Eddy <eddy.lai.tw@gmail.com> wrote:

> under the openembedded-core folder
> only meta , meta-selftest , meta-skeleton 3 sub-folder found
> no openembedded-core/meta-oe
>                                         meta-networking
>                                         meta-ruby
>                                         meta-python...
>


I didn't say openembedded-core, it was meta-openembedded

Bruce


>
> 2017-09-26 8:47 GMT+08:00 Bruce Ashfield <bruce.ashfield@gmail.com>:
>
>> On Mon, Sep 25, 2017 at 8:16 PM, Lai Eddy <eddy.lai.tw@gmail.com> wrote:
>> >
>> > Thanks Bruce,
>> >
>> > but I still don't understand,now I have following in my bblayrs.conf
>> >
>> > BBLAYERS ?= " \
>> >   /home/user/poky/meta \
>> >   /home/user/poky/meta-poky \
>> >   /home/user/poky/meta-yocto-bsp \
>> >   /home/user/poky/openembedded-core/meta \
>> >   /home/user/poky/meta-cloud-services \
>> >   /home/user/poky/meta-cloud-services/meta-openstack \
>> >   /home/user/poky/meta-intel \
>> > "
>> > anything else I should add?
>>
>>
>> You do need more. The meta-openstack README states:
>>
>> layers: meta-oe
>> meta-networking
>>         meta-ruby
>>         meta-filesystems
>>         meta-webserver
>>         meta-python
>>
>>
>> Which means:
>>
>> meta-openembedded/meta-oe
>> meta-openembedded/meta-networking
>>
>> ... etc
>>
>> And as Paul just pointed out, you don't repeat poky/meta and
>> poky/open-embedded-core/meta,
>> since poky/meta is a combination of openembedded-core/meta and some
>>
>> other layers
>>
>> Cheers,
>>
>> Bruce
>>
>>
>> >
>> > 2017-09-26 8:07 GMT+08:00 Bruce Ashfield <bruce.ashfield@gmail.com>:
>> >>
>> >>
>> >>
>> >> On Mon, Sep 25, 2017 at 5:26 PM, Lai Eddy <eddy.lai.tw@gmail.com>
>> wrote:
>> >>>
>> >>> after clone the oe-core: git://git.openembedded.org/openembedded-core
>> >>> there are only 3 folder inside (meta, meta-selftest meta-skeleton)
>> >>> seems meta-cloud-services need things like meta-networking and
>> meta-python
>> >>> where can I found them?
>> >>>
>> >>> (that's why I think the needed dependency is  git://
>> github.com/openembedded/meta-openembedded.git )
>> >>
>> >>
>> >> They are sublayers of that repo, the single clone gets you all the
>> layers you need, but
>> >> you do need to add them to your bblayers.conf file as they sit in the
>> clone.
>> >>
>> >> Bruce
>> >>
>> >>>
>> >>>
>> >>> 2017-09-20 10:28 GMT+08:00 Bruce Ashfield <bruce.ashfield@gmail.com>:
>> >>>>
>> >>>>
>> >>>>
>> >>>> On Tue, Sep 19, 2017 at 10:15 PM, Bruce Ashfield <
>> bruce.ashfield@gmail.com> wrote:
>> >>>>>
>> >>>>> Clearly the README is out of date (and wrong).
>> >>>>>
>> >>>>> That should be oe-core: git://git.openembedded.org/ope
>> nembedded-core
>> >>>>>
>> >>>>> Plus that isn't nearly the only layer dependency
>> >>>>>
>> >>>>> I'll have a look at what has gone wrong and update the README.
>> >>>>
>> >>>>
>> >>>> I pushed a fix for the meta-cloud-services/README, which is mostly
>> empty since the
>> >>>> majority of the packages are actually in the meta-openstack
>> sublayer.  That layer had
>> >>>> the same issue with the layer references, so I fixed it as well.
>> >>>>
>> >>>> Cheers,
>> >>>>
>> >>>> Bruce
>> >>>>
>> >>>>>
>> >>>>>
>> >>>>> Bruce
>> >>>>>
>> >>>>> On Tue, Sep 19, 2017 at 8:23 PM, Lai Eddy <eddy.lai.tw@gmail.com>
>> wrote:
>> >>>>>>
>> >>>>>> according to layer README
>> >>>>>> http://git.yoctoproject.org/cgit/cgit.cgi/meta-cloud-service
>> s/about/
>> >>>>>> it said
>> >>>>>>
>> >>>>>> This layer depends on:
>> >>>>>>
>> >>>>>> URI: git://github.com/openembedded/oe-core.git
>> >>>>>>
>> >>>>>> but seems failed to clone from that URL
>> >>>>>> should that be
>> >>>>>> git://github.com/openembedded/meta-openembedded.git
>> >>>>>> or other repo available?
>> >>>>>>
>> >>>>>>
>> >>>>>> --
>> >>>>>> _______________________________________________
>> >>>>>> meta-virtualization mailing list
>> >>>>>> meta-virtualization@yoctoproject.org
>> >>>>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>> >>>>>>
>> >>>>>
>> >>>>>
>> >>>>>
>> >>>>> --
>> >>>>> "Thou shalt not follow the NULL pointer, for chaos and madness
>> await thee at its end"
>> >>>>
>> >>>>
>> >>>>
>> >>>>
>> >>>> --
>> >>>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>> >>>
>> >>>
>> >>
>> >>
>> >>
>> >> --
>> >> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>> >
>> >
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>>
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c083c8c42b8ea055a16b821
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Sep 26, 2017 at 12:45 AM, Lai Eddy <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:eddy.lai.tw@gmail.com" target=3D"_blank">eddy.lai.tw@gmail.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr">under the openembedded-core folder<div>only meta , meta-se=
lftest , meta-skeleton 3 sub-folder found</div><div>no openembedded-core/me=
ta-oe</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 meta-networking</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 meta-ruby</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta-python...<br></div></div></bloc=
kquote><div><br></div><div><br></div><div>I didn&#39;t say openembedded-cor=
e, it was=C2=A0meta-openembedded</div><div><br></div><div>Bruce</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr"><div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><span cl=
ass=3D"gmail-">2017-09-26 8:47 GMT+08:00 Bruce Ashfield <span dir=3D"ltr">&=
lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashf=
ield@gmail.com</a>&gt;</span>:<br></span><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><span class=3D"gmail-m_-4400102621140864493gmail-"><span cl=
ass=3D"gmail-">On Mon, Sep 25, 2017 at 8:16 PM, Lai Eddy &lt;<a href=3D"mai=
lto:eddy.lai.tw@gmail.com" target=3D"_blank">eddy.lai.tw@gmail.com</a>&gt; =
wrote:<br>
&gt;<br>
&gt; Thanks Bruce,<br>
&gt;<br>
&gt; but I still don&#39;t understand,now I have following in my bblayrs.co=
nf<br>
&gt;<br>
&gt; BBLAYERS ?=3D &quot; \<br>
&gt;=C2=A0 =C2=A0/home/user/poky/meta \<br>
&gt;=C2=A0 =C2=A0/home/user/poky/meta-poky \<br>
&gt;=C2=A0 =C2=A0/home/user/poky/meta-yocto-<wbr>bsp \<br></span>
&gt;=C2=A0 =C2=A0/home/user/poky/openembedded-<wbr>core/meta \<span class=
=3D"gmail-"><br>
&gt;=C2=A0 =C2=A0/home/user/poky/meta-cloud-se<wbr>rvices \<br>
&gt;=C2=A0 =C2=A0/home/user/poky/meta-cloud-se<wbr>rvices/meta-openstack \<=
br>
&gt;=C2=A0 =C2=A0/home/user/poky/meta-intel \<br>
&gt; &quot;<br>
&gt; anything else I should add?<br>
<br>
<br>
</span></span><span class=3D"gmail-">You do need more. The meta-openstack R=
EADME states:<br>
<br>
layers: meta-oe<br>
meta-networking<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta-ruby<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta-filesystems<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta-webserver<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta-python<br>
<br>
<br>
Which means:<br>
<br>
meta-openembedded/meta-oe<br>
meta-openembedded/meta-network<wbr>ing<br>
<br>
... etc<br>
<br>
And as Paul just pointed out, you don&#39;t repeat poky/meta and<br>
poky/open-embedded-core/meta,<br></span>
since poky/meta is a combination of openembedded-core/meta and some<div><di=
v class=3D"gmail-h5"><br>
other layers<br>
<br>
Cheers,<br>
<br>
Bruce<br>
<div class=3D"gmail-m_-4400102621140864493gmail-HOEnZb"><div class=3D"gmail=
-m_-4400102621140864493gmail-h5"><br>
<br>
&gt;<br>
&gt; 2017-09-26 8:07 GMT+08:00 Bruce Ashfield &lt;<a href=3D"mailto:bruce.a=
shfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Sep 25, 2017 at 5:26 PM, Lai Eddy &lt;<a href=3D"mailto:ed=
dy.lai.tw@gmail.com" target=3D"_blank">eddy.lai.tw@gmail.com</a>&gt; wrote:=
<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; after clone the oe-core: git://<a href=3D"http://git.openembed=
ded.org/openembedded-core" rel=3D"noreferrer" target=3D"_blank">git.openemb=
edded.org/ope<wbr>nembedded-core</a><br>
&gt;&gt;&gt; there are only 3 folder inside (meta, meta-selftest meta-skele=
ton)<br>
&gt;&gt;&gt; seems meta-cloud-services need things like meta-networking and=
 meta-python<br>
&gt;&gt;&gt; where can I found them?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; (that&#39;s why I think the needed dependency is=C2=A0 git://<=
a href=3D"http://github.com/openembedded/meta-openembedded.git" rel=3D"nore=
ferrer" target=3D"_blank">github.com/openembedded/<wbr>meta-openembedded.gi=
t</a> )<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; They are sublayers of that repo, the single clone gets you all the=
 layers you need, but<br>
&gt;&gt; you do need to add them to your bblayers.conf file as they sit in =
the clone.<br>
&gt;&gt;<br>
&gt;&gt; Bruce<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; 2017-09-20 10:28 GMT+08:00 Bruce Ashfield &lt;<a href=3D"mailt=
o:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&=
gt;:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On Tue, Sep 19, 2017 at 10:15 PM, Bruce Ashfield &lt;<a hr=
ef=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gma=
il.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Clearly the README is out of date (and wrong).<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; That should be oe-core: git://<a href=3D"http://git.op=
enembedded.org/openembedded-core" rel=3D"noreferrer" target=3D"_blank">git.=
openembedded.org/ope<wbr>nembedded-core</a><br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Plus that isn&#39;t nearly the only layer dependency<b=
r>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; I&#39;ll have a look at what has gone wrong and update=
 the README.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I pushed a fix for the meta-cloud-services/README, which i=
s mostly empty since the<br>
&gt;&gt;&gt;&gt; majority of the packages are actually in the meta-openstac=
k sublayer.=C2=A0 That layer had<br>
&gt;&gt;&gt;&gt; the same issue with the layer references, so I fixed it as=
 well.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Cheers,<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Bruce<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Bruce<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; On Tue, Sep 19, 2017 at 8:23 PM, Lai Eddy &lt;<a href=
=3D"mailto:eddy.lai.tw@gmail.com" target=3D"_blank">eddy.lai.tw@gmail.com</=
a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; according to layer README<br>
&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"http://git.yoctoproject.org/cgit/cgit.c=
gi/meta-cloud-services/about/" rel=3D"noreferrer" target=3D"_blank">http://=
git.yoctoproject.org/cg<wbr>it/cgit.cgi/meta-cloud-service<wbr>s/about/</a>=
<br>
&gt;&gt;&gt;&gt;&gt;&gt; it said<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; This layer depends on:<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; URI: git://<a href=3D"http://github.com/openembedd=
ed/oe-core.git" rel=3D"noreferrer" target=3D"_blank">github.com/openembedde=
d/<wbr>oe-core.git</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; but seems failed to clone from that URL<br>
&gt;&gt;&gt;&gt;&gt;&gt; should that be<br>
&gt;&gt;&gt;&gt;&gt;&gt; git://<a href=3D"http://github.com/openembedded/me=
ta-openembedded.git" rel=3D"noreferrer" target=3D"_blank">github.com/openem=
bedded/<wbr>meta-openembedded.git</a><br>
&gt;&gt;&gt;&gt;&gt;&gt; or other repo available?<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt;&gt;&gt; ______________________________<wbr>_______________=
__<br>
&gt;&gt;&gt;&gt;&gt;&gt; meta-virtualization mailing list<br>
&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"mailto:meta-virtualization@yoctoproject=
.org" target=3D"_blank">meta-virtualization@yoctoproje<wbr>ct.org</a><br>
&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"https://lists.yoctoproject.org/listinfo=
/meta-virtualization" rel=3D"noreferrer" target=3D"_blank">https://lists.yo=
ctoproject.org<wbr>/listinfo/meta-virtualization</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt;&gt; &quot;Thou shalt not follow the NULL pointer, for chao=
s and madness await thee at its end&quot;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt; &quot;Thou shalt not follow the NULL pointer, for chaos an=
d madness await thee at its end&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; &quot;Thou shalt not follow the NULL pointer, for chaos and madnes=
s await thee at its end&quot;<br>
&gt;<br>
&gt;<br>
<br>
<br>
<br>
--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await<b=
r>
thee at its end&quot;<br>
</div></div></div></div></blockquote></div><br></div></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for chao=
s and madness await thee at its end&quot;</div>
</div></div>

--94eb2c083c8c42b8ea055a16b821--
