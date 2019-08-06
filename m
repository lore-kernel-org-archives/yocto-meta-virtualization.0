Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 85F30E00D38; Mon,  5 Aug 2019 18:14:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.128.66 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3B1F8E00A93
	for <meta-virtualization@yoctoproject.org>;
	Mon,  5 Aug 2019 18:14:03 -0700 (PDT)
Received: by mail-wm1-f66.google.com with SMTP id v15so76447292wml.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 05 Aug 2019 18:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0Nmmb73OJtznelfBiSz1Blg3eAbByXt8/88vlsUMGeI=;
	b=IVcTW63vENUr3FCz+iqPizPbLHBrL+8ngfrrCQ2Fls78oGDOQftd4AKqshlzKhliqK
	1RhoDufY8r4OSEHxUUABJY0Qtpn6Hp3nOoofhtTP0o+9Le+8HH+8y6YD2KC2+VmIHHVV
	XjEcVzWNyi592m95Eh+9rB2QXysQPnwIwwo4sFHaPXFpa9/jkZHhRwSW15P1vWtKfmS1
	QoRVT64s+cOSOPWMGeFuIrYPpG04ECJbT6+pDzFNK7RVUWEuCEdIvdLlI3BF3h2rEYPS
	pX+/WnqqVQnI/uNS2viNbd8qHIzg5dAMPtO7HyyWUBPl3/NB/9oYMgmceAbMVuOP3Ufe
	sPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0Nmmb73OJtznelfBiSz1Blg3eAbByXt8/88vlsUMGeI=;
	b=r07r7TsNqf4j5fWgbZShHT4AeYKhkzVGIBrl4AFDuwOe5nuMwUEBmgPzmu9R5M2Yeq
	s+/Q/mzR1IbMorSkQbkFP8R7qB8D8mnbFntp6whrRvpEDnwiRgn+MlBmLC2ptLFTCm6d
	pNrvs+oSqng1fJ+r3xuZ46HE1Hfw2+R9ySkXyds7qIGI58XyS2CWsMH46OGEcQA7DmoB
	sSIctPee0vrHzk/aonq+xaPW9VuDEm7J7bPegiqRaR4NInbeQCJ2yaAH7Gn3yrreZJll
	/0mJruPHc2J+//YHK2ZqEf6di3hsImsgnWEBhqKBh+VjGa+YJjlwAPRT+egPcyQG9gfp
	aWCQ==
X-Gm-Message-State: APjAAAUiyIssWMMQHf24RLY+g2jN8waDucD+cw/Ll2mrfHvzyckOUkia
	W+bsx0dfqsNNOwNI8V93R+LylbCCecUYzPlFBHA=
X-Google-Smtp-Source: APXvYqw2aAmw/HCNTG29tULF2Ntj2+gLlfr8mJShAc84j3IMP9MwEfzZgkyPaN2lG51nA5uY0sX5vmYAT8mj6c0q9ho=
X-Received: by 2002:a1c:a686:: with SMTP id p128mr864749wme.130.1565054042108; 
	Mon, 05 Aug 2019 18:14:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190805060143.24108-1-Qi.Chen@windriver.com>
	<20190805060143.24108-2-Qi.Chen@windriver.com>
	<CADkTA4OYhWqw_nRRYx4=mjz2Pasxude6sPQyhiaWFwBuRYK2Gg@mail.gmail.com>
	<62ce21c1-d9c9-7c83-5282-793c1a055f3f@windriver.com>
In-Reply-To: <62ce21c1-d9c9-7c83-5282-793c1a055f3f@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 5 Aug 2019 22:13:49 -0300
Message-ID: <CADkTA4PV6mipQM58+M3LUpzguFXtyNrzYN7b+Qfc4QUGQF1P4A@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 2/4] runc: remove static to enable building systemd support
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
X-List-Received-Date: Tue, 06 Aug 2019 01:14:04 -0000
Content-Type: multipart/alternative; boundary="0000000000003bf87d058f688a0e"

--0000000000003bf87d058f688a0e
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 5, 2019 at 8:52 AM ChenQi <Qi.Chen@windriver.com> wrote:

> On 08/05/2019 07:28 PM, Bruce Ashfield wrote:
>
>
>
> On Mon., Aug. 5, 2019, 3:02 a.m. Chen Qi, <Qi.Chen@windriver.com> wrote:
>
>> Remove the 'static' from do_compile to enable systemd support.
>> This avoid runtime error is docker's cgroup driver is set to systemd
>> on systemd based images.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>  recipes-containers/runc/runc.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-containers/runc/runc.inc
>> b/recipes-containers/runc/runc.inc
>> index 46fd09d..1f2f944 100644
>> --- a/recipes-containers/runc/runc.inc
>> +++ b/recipes-containers/runc/runc.inc
>> @@ -54,7 +54,7 @@ do_compile() {
>>         export CFLAGS=""
>>         export LDFLAGS=""
>>
>> -       oe_runmake static
>> +       oe_runmake
>>
>
>
> This needs to be optional, via a packageconfig that can be overidden and
> that can trigger a default of the init manager is systemd. (I actually want
> static and systemd in my configs )
>
> Bruce
>
>
> So we introduce a PACKAGECONFIG, whose effect is using static when enabled
> and dropping static when disabled. By default, it's disabled if systemd is
> in use.
>


Yes. That's what I meant, but on further thought, I'd prefer to not change
the default build config even with systemd enabled at the moment.

So we can introduce a packageconfig, make static the default and then allow
bbappends to change it to what they want. Once it has been in the layer for
a bit, we can change the default.

Bruce



>
> Right?
>
> Regards,
> Chen Qi
>
>  }
>>
>>  do_install() {
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000003bf87d058f688a0e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Aug 5, 2019 at 8:52 AM ChenQi &lt;<a href=
=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF">
    <div class=3D"gmail-m_-3716679754286309437moz-cite-prefix">On 08/05/201=
9 07:28 PM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"auto">
        <div><br>
          <br>
          <div class=3D"gmail_quote">
            <div dir=3D"ltr" class=3D"gmail_attr">On Mon., Aug. 5, 2019,
              3:02 a.m. Chen Qi, &lt;<a href=3D"mailto:Qi.Chen@windriver.co=
m" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Remove
              the &#39;static&#39; from do_compile to enable systemd suppor=
t.<br>
              This avoid runtime error is docker&#39;s cgroup driver is set
              to systemd<br>
              on systemd based images.<br>
              <br>
              Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windrive=
r.com" rel=3D"noreferrer" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<b=
r>
              ---<br>
              =C2=A0recipes-containers/runc/runc.inc | 2 +-<br>
              =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
              <br>
              diff --git a/recipes-containers/runc/runc.inc
              b/recipes-containers/runc/runc.inc<br>
              index 46fd09d..1f2f944 100644<br>
              --- a/recipes-containers/runc/runc.inc<br>
              +++ b/recipes-containers/runc/runc.inc<br>
              @@ -54,7 +54,7 @@ do_compile() {<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 export CFLAGS=3D&quot;&quot;<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 export LDFLAGS=3D&quot;&quot;<br>
              <br>
              -=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake static<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake<br>
            </blockquote>
          </div>
        </div>
        <div dir=3D"auto"><br>
        </div>
        <div dir=3D"auto"><br>
        </div>
        <div dir=3D"auto">This needs to be optional, via a packageconfig
          that can be overidden and that can trigger a default of the
          init manager is systemd. (I actually want static and systemd
          in my configs )</div>
        <div dir=3D"auto"><br>
        </div>
        <div dir=3D"auto">Bruce</div>
        <div dir=3D"auto"><br>
        </div>
      </div>
    </blockquote>
    <br>
    So we introduce a PACKAGECONFIG, whose effect is using static when
    enabled and dropping static when disabled. By default, it&#39;s disable=
d
    if systemd is in use.<br></div></blockquote><div><br></div><div><br></d=
iv><div><div class=3D"gmail_default" style=3D"font-size:small">Yes. That&#3=
9;s what I meant, but on further thought, I&#39;d prefer to not change the =
default build config even with systemd enabled at the moment.</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmai=
l_default" style=3D"font-size:small">So we can introduce a packageconfig, m=
ake static the default and then allow bbappends to change it to what they w=
ant. Once it has been in the layer for a bit, we can change the default.</d=
iv><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div bgcolor=
=3D"#FFFFFF">
    <br>
    Right?<br>
    <br>
    Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote type=3D"cite">
      <div dir=3D"auto">
        <div dir=3D"auto">
          <div class=3D"gmail_quote">
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              =C2=A0}<br>
              <br>
              =C2=A0do_install() {<br>
              -- <br>
              2.17.1<br>
              <br>
              -- <br>
              _______________________________________________<br>
              meta-virtualization mailing list<br>
              <a href=3D"mailto:meta-virtualization@yoctoproject.org" rel=
=3D"noreferrer" target=3D"_blank">meta-virtualization@yoctoproject.org</a><=
br>
              <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtu=
alization" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yo=
ctoproject.org/listinfo/meta-virtualization</a><br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </div>

</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--0000000000003bf87d058f688a0e--
