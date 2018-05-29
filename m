Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4C6DFE00C76; Tue, 29 May 2018 08:01:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.68 listed in list.dnswl.org]
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
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2F0F7E009D4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 May 2018 08:00:29 -0700 (PDT)
Received: by mail-wm0-f68.google.com with SMTP id o78-v6so41629284wmg.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 May 2018 08:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VyaLMTFyeB80SprrhSJGqfAtjbxILc/3WEcIs5BBFUo=;
	b=E2K4rAOh6wxoiK28Pg9A0qKkwj81vo1haUr3pVKs1CVlQqoDTXOleEM9sEqgo1DT+K
	4NnuPr/4aLdCl/t6wIp49zG4DlwnKPLgyVgFymSl8LhPZC4JTli9jwsddYEDrzePW1tx
	boZP5KFwDMgftEfKR+W6vzq+39WE9H4XKjmaDlxoOZMqPvrU4YtRE4gVXWTcPmuth/pE
	h5g2J4r7Pp8TTDxppps81xmx/IBLKHf0qzBL85PHdmqAQGr1QCu1eG/QXuvFK3bGknoz
	jicM0wAHfGfMQ9zt2wZ9IwQDJtgoui6Ru/c2tXAzmCjFfzQ8cZ/tKFUWiPSqfSqIZ/lD
	avPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VyaLMTFyeB80SprrhSJGqfAtjbxILc/3WEcIs5BBFUo=;
	b=NqQWLtTd2WR9eiynZDHpM0QA6dbuHBRpZg8rRHY3oFHBAyPZY3Dl7svkPsEX5RWOle
	AGBhHCQ7RP2JAyR3Ny/rQs+tAod5y/lLrqvLi0Xb2PJl6g/mcOtDdpb/eXpO3Keq2sDZ
	BmBr38zhEDPKAy+4Dxh8E7ovxDFe9UpN74BK5de56wJTtR8ysnV0+lL2m98Q8zWt+mx2
	iEf+G9HE5uBq6H674n0ON2QPm9q5/ZHp9uRkkO2Wlc672aR5MX4SWb9bk+YXtkdqa7JS
	scJB6+GQQxZhEZm6VMGRZLlTL2M+Ngjblq2sRT4il4VcojIcRoqhP25YJ+SnZXK1SB2D
	F3KA==
X-Gm-Message-State: ALKqPwe6QWHsBB1xiGfMPzPPOlv94l3zNuVHPMNrZxwJlL8milSgcJzw
	4CfOMR43dNL90h6kfHp5vSFHPKNeFIrhE1c9BUQ=
X-Google-Smtp-Source: ADUXVKI3P8pgmS5Isd7OBgnzsPNI447NaHjsjmMDp5FYZNtahrFQOAJfxs7OXClxDjx8uFYOwB/AVXJZ908qjafIoOU=
X-Received: by 2002:a2e:5358:: with SMTP id
	t24-v6mr2672908ljd.129.1527606028985; 
	Tue, 29 May 2018 08:00:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:3307:0:0:0:0:0 with HTTP; Tue, 29 May 2018 08:00:28
	-0700 (PDT)
In-Reply-To: <79fc5d20-111d-5bec-5e10-0fe210ad2d0f@gmail.com>
References: <20180525135820.9279-1-pascal.bach@siemens.com>
	<CADkTA4POi2ym7_hXqNuwMT-4dCMnMBVWMkEsuvuhqVGNnym3EQ@mail.gmail.com>
	<765b8896-ad3b-4e58-18e0-78ab15e31d9e@gmail.com>
	<CADkTA4M9Rz8FerSQxVYLC4Xnb8=TJo3WsD4BcQqgX89ZAyTRew@mail.gmail.com>
	<79fc5d20-111d-5bec-5e10-0fe210ad2d0f@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 29 May 2018 11:00:28 -0400
Message-ID: <CADkTA4MkW4mY+m-FXq-KQxiG-FoM8NW30=rC4Qq2xPi+MwSJ=A@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 1/2] runc: allow enabling seccomp
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
X-List-Received-Date: Tue, 29 May 2018 15:01:43 -0000
Content-Type: multipart/alternative; boundary="000000000000b6e846056d597e1a"

--000000000000b6e846056d597e1a
Content-Type: text/plain; charset="UTF-8"

On Tue, May 29, 2018 at 10:56 AM, akuster808 <akuster808@gmail.com> wrote:

>
>
> On 05/29/2018 07:45 AM, Bruce Ashfield wrote:
>
>
>
> On Tue, May 29, 2018 at 10:33 AM, akuster808 <akuster808@gmail.com> wrote:
>
>>
>>
>> On 05/29/2018 07:25 AM, Bruce Ashfield wrote:
>>
>> merged.
>>
>> Bruce
>>
>> On Fri, May 25, 2018 at 9:58 AM, Pascal Bach <pascal.bach@siemens.com>
>> wrote:
>>
>>> This requires libseccomp from meta-security so it is not enabled by
>>> default.
>>>
>>
>> will there be a patch to add this dependency to the layer.conf ?
>>
>
>
> We just tweaked it, but yes it will need another patch.
>
> But that dependency is conditional, do we have examples of how to make the
> layer.conf dependency conditional ? We may need a distro or other feature,
> I suppose.
>
> or we just move libseccomp to meta-oe and call it a day ; ) ( something I
> have been thinking about for a while)
>

No objections here!

Bruce


>
> - armin
>
>
> Bruce
>
>
>>
>> - armin
>>
>>
>>> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
>>> ---
>>>  recipes-containers/runc/runc.inc | 6 +++++-
>>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/recipes-containers/runc/runc.inc
>>> b/recipes-containers/runc/runc.inc
>>> index 9199cef..6d11a6e 100644
>>> --- a/recipes-containers/runc/runc.inc
>>> +++ b/recipes-containers/runc/runc.inc
>>> @@ -12,6 +12,10 @@ PV = "${RUNC_VERSION}+git${SRCPV}"
>>>
>>>  inherit go
>>>  inherit goarch
>>> +inherit pkgconfig
>>> +
>>> +PACKAGECONFIG ??= ""
>>> +PACKAGECONFIG[seccomp] = "seccomp,,libseccomp"
>>>
>>>  RRECOMMENDS_${PN} = "lxc docker"
>>>  PROVIDES += "virtual/runc"
>>> @@ -22,7 +26,7 @@ GO_IMPORT = "import"
>>>  LIBCONTAINER_PACKAGE="github.com/opencontainers/runc/libcontainer"
>>>
>>>  do_configure[noexec] = "1"
>>> -EXTRA_OEMAKE="BUILDTAGS='' GO=${GO}"
>>> +EXTRA_OEMAKE="BUILDTAGS='${PACKAGECONFIG_CONFARGS}' GO=${GO}"
>>>
>>>  do_compile() {
>>>         # Set GOPATH. See 'PACKAGERS.md'. Don't rely on
>>> --
>>> 2.11.0
>>>
>>> --
>>> _______________________________________________
>>> meta-virtualization mailing list
>>> meta-virtualization@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>>
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
>> at its end"
>>
>>
>>
>>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>
>
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--000000000000b6e846056d597e1a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, May 29, 2018 at 10:56 AM, akuster808 <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF"><span class=3D"">
    <p><br>
    </p>
    <br>
    <div class=3D"m_598032205878937196moz-cite-prefix">On 05/29/2018 07:45 =
AM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr"><br>
        <div class=3D"gmail_extra"><br>
          <div class=3D"gmail_quote">On Tue, May 29, 2018 at 10:33 AM,
            akuster808 <span dir=3D"ltr">&lt;<a href=3D"mailto:akuster808@g=
mail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</span>
            wrote:<br>
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
              <div text=3D"#000000" bgcolor=3D"#FFFFFF"><span>
                  <p><br>
                  </p>
                  <br>
                  <div class=3D"m_598032205878937196m_-403219837174514555mo=
z-cite-prefix">On
                    05/29/2018 07:25 AM, Bruce Ashfield wrote:<br>
                  </div>
                  <blockquote type=3D"cite">
                    <div dir=3D"ltr">merged.
                      <div><br>
                      </div>
                      <div>Bruce</div>
                    </div>
                    <div class=3D"gmail_extra"><br>
                      <div class=3D"gmail_quote">On Fri, May 25, 2018 at
                        9:58 AM, Pascal Bach <span dir=3D"ltr">&lt;<a href=
=3D"mailto:pascal.bach@siemens.com" target=3D"_blank">pascal.bach@siemens.c=
om</a>&gt;</span>
                        wrote:<br>
                        <blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This requires
                          libseccomp from meta-security so it is not
                          enabled by default.<br>
                        </blockquote>
                      </div>
                    </div>
                  </blockquote>
                  <br>
                </span> will there be a patch to add this dependency to
                the layer.conf ?<br>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div><br>
            </div>
            <div>We just tweaked it, but yes it will need another patch.</d=
iv>
            <div><br>
            </div>
            <div>But that dependency is conditional, do we have examples
              of how to make the layer.conf dependency conditional ? We
              may need a distro or other feature, I suppose.</div>
          </div>
        </div>
      </div>
    </blockquote></span>
    or we just move libseccomp to meta-oe and call it a day ; ) (
    something I have been thinking about for a while)<br></div></blockquote=
><div><br></div><div>No objections here!</div><div><br></div><div>Bruce</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div text=3D"#000000" bgc=
olor=3D"#FFFFFF">
    <br>
    - armin<div><div class=3D"h5"><br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <div><br>
            </div>
            <div>Bruce=C2=A0</div>
            <div>=C2=A0</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
              <div text=3D"#000000" bgcolor=3D"#FFFFFF"> <br>
                - armin
                <div>
                  <div class=3D"m_598032205878937196h5"><br>
                    <blockquote type=3D"cite">
                      <div class=3D"gmail_extra">
                        <div class=3D"gmail_quote">
                          <blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"> <br>
                            Signed-off-by: Pascal Bach &lt;<a href=3D"mailt=
o:pascal.bach@siemens.com" target=3D"_blank">pascal.bach@siemens.com</a>&gt=
;<br>
                            ---<br>
                            =C2=A0recipes-containers/runc/runc.<wbr>inc | 6
                            +++++-<br>
                            =C2=A01 file changed, 5 insertions(+), 1
                            deletion(-)<br>
                            <br>
                            diff --git a/recipes-containers/runc/runc<wbr>.=
inc
                            b/recipes-containers/runc/runc<wbr>.inc<br>
                            index 9199cef..6d11a6e 100644<br>
                            --- a/recipes-containers/runc/runc<wbr>.inc<br>
                            +++ b/recipes-containers/runc/runc<wbr>.inc<br>
                            @@ -12,6 +12,10 @@ PV =3D
                            &quot;${RUNC_VERSION}+git${SRCPV}&quot;<br>
                            <br>
                            =C2=A0inherit go<br>
                            =C2=A0inherit goarch<br>
                            +inherit pkgconfig<br>
                            +<br>
                            +PACKAGECONFIG ??=3D &quot;&quot;<br>
                            +PACKAGECONFIG[seccomp] =3D
                            &quot;seccomp,,libseccomp&quot;<br>
                            <br>
                            =C2=A0RRECOMMENDS_${PN} =3D &quot;lxc docker&qu=
ot;<br>
                            =C2=A0PROVIDES +=3D &quot;virtual/runc&quot;<br=
>
                            @@ -22,7 +26,7 @@ GO_IMPORT =3D &quot;import&qu=
ot;<br>
                            =C2=A0LIBCONTAINER_PACKAGE=3D&quot;<a href=3D"h=
ttp://github.com/opencontainers/runc/libcontainer" rel=3D"noreferrer" targe=
t=3D"_blank">github.<wbr>com/opencontainers/runc/libcon<wbr>tainer</a>&quot=
;<br>
                            <br>
                            =C2=A0do_configure[noexec] =3D &quot;1&quot;<br=
>
                            -EXTRA_OEMAKE=3D&quot;BUILDTAGS=3D&#39;&#39; GO=
=3D${GO}&quot;<br>
                            +EXTRA_OEMAKE=3D&quot;BUILDTAGS=3D&#39;${PA<wbr=
>CKAGECONFIG_CONFARGS}&#39;
                            GO=3D${GO}&quot;<br>
                            <br>
                            =C2=A0do_compile() {<br>
                            =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Set GOPATH. See &=
#39;PACKAGERS.md&#39;.
                            Don&#39;t rely on<br>
                            <span class=3D"m_598032205878937196m_-403219837=
174514555HOEnZb"><font color=3D"#888888">-- <br>
                                2.11.0<br>
                                <br>
                                -- <br>
                                ______________________________<wbr>________=
_________<br>
                                meta-virtualization mailing list<br>
                                <a href=3D"mailto:meta-virtualization@yocto=
project.org" target=3D"_blank">meta-virtualization@yoctoproje<wbr>ct.org</a=
><br>
                                <a href=3D"https://lists.yoctoproject.org/l=
istinfo/meta-virtualization" rel=3D"noreferrer" target=3D"_blank">https://l=
ists.yoctoproject.org<wbr>/listinfo/meta-virtualization</a><br>
                              </font></span></blockquote>
                        </div>
                        <br>
                        <br clear=3D"all">
                        <div><br>
                        </div>
                        -- <br>
                        <div class=3D"m_598032205878937196m_-40321983717451=
4555gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt
                          not follow the NULL pointer, for chaos and
                          madness await thee at its end&quot;</div>
                      </div>
                      <br>
                      <fieldset class=3D"m_598032205878937196m_-40321983717=
4514555mimeAttachmentHeader"></fieldset>
                      <br>
                    </blockquote>
                    <br>
                  </div>
                </div>
              </div>
            </blockquote>
          </div>
          <br>
          <br clear=3D"all">
          <div><br>
          </div>
          -- <br>
          <div class=3D"m_598032205878937196gmail_signature" data-smartmail=
=3D"gmail_signature">&quot;Thou
            shalt not follow the NULL pointer, for chaos and madness
            await thee at its end&quot;</div>
        </div>
      </div>
      <br>
      <fieldset class=3D"m_598032205878937196mimeAttachmentHeader"></fields=
et>
      <br>
    </blockquote>
    <br>
  </div></div></div>

</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--000000000000b6e846056d597e1a--
