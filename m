Return-Path: <kurt.bodiker@braintrust-us.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E5292E008D3; Thu, 22 Mar 2018 09:11:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.214.49 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 56000E0070F
	for <meta-virtualization@yoctoproject.org>;
	Thu, 22 Mar 2018 09:11:52 -0700 (PDT)
Received: by mail-it0-f49.google.com with SMTP id e195-v6so12017076ita.5
	for <meta-virtualization@yoctoproject.org>;
	Thu, 22 Mar 2018 09:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=braintrust-us-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3w513+n9FoEMhAAvtSnX/AvGcDAn3u7suX8HQmSQyk4=;
	b=eiq7vB1xsl3Iv3nPiSvf6jYXdRtiqdxLGr3bu1HHMAM5AJxffT1dfjRWWxVAqYS7D2
	xFRjttDwS2nN/YmQDkb96gYoEAUqz/S82lDtY7mnZG1dJn8Zd62sgkD1sj7PiMAYlLGr
	56HK1o/v9oJpKtIXfizeNcpDYulDgDHeJvflf7CGcyFkw5rmdlmXhXCAuqxWi4/tTEBT
	2NMjwqFik1yMbPqLC0pSJoSZIpP3Yu+IssiknAV0EIsa2Evtxgk9u6n4pBAhJ1fbFVyp
	wO6rHIEXt1Br7xdPI4SKm1hqYSKxzn4v+ws9X+UXeIeX7AFm8fyxx/ekjnI2Q5P3wWeq
	G0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3w513+n9FoEMhAAvtSnX/AvGcDAn3u7suX8HQmSQyk4=;
	b=tf0O3DZcq9BP8/I2HR4P4cz91x/JdAIsTkVvaBUfk9LvH1TMjWZLZLc/Lcu1pU2qjf
	OGoIejRLm4wxR8QaGzX9O6965NTCC2FXOfcN7bHl3uMVdE9t/ReSqH8MknlYcQvcXQF5
	7KBwZo1sI3/I5PgdBfN7zL85vtfaWbi21abCIAyMRCS7RKFVv4PW4MnT75M6IxxdQhXd
	vc+TsVGKHHO+95qHaoCTo2Fce8D9eHLgYSREyODhza59DYuZY6d3xwRBwRWfinuyySjG
	jwCuLwBVQCSfknFp35tkUJzJEFiywYZ0wsCrtLeYhCEB1Oa7RPrzhDpv3z0xRkoOg8Pt
	Fq2g==
X-Gm-Message-State: AElRT7Ezd5+F9vjxfNoC7aIvJS8DTlsNSuDRH9H/a8Aub5yBv4wmwur5
	4o4SKN+0ykRlp0LCXg7/9JOXC2sKbyFxeXn0ZaVPfKwxG8zEURZC2pnIloFOLjKzmpObbNH2Ep/
	aJhHhNTzlBsJFaR/2WqBWk3UNihM6/MP+CzEKuYYaJCa2
X-Google-Smtp-Source: AG47ELtVZlMNrW355rF/QdV3Vg8H6nVjH6EeeAH0oAJxqW6AMckiqzzJjhyZ93S4TS9LI/1a4mvXyjJGolo/ZJBw+yY=
X-Received: by 2002:a24:dd97:: with SMTP id
	t145-v6mr4706468itf.114.1521735112339; 
	Thu, 22 Mar 2018 09:11:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.209.146 with HTTP; Thu, 22 Mar 2018 09:11:51 -0700 (PDT)
In-Reply-To: <CACMJ4GbGA+De1quOn_qa4FGNWuPdXmycrUbJcdoCdBzohTfmJA@mail.gmail.com>
References: <cover.1519915283.git.kurt.bodiker@braintrust-us.com>
	<d59c1a4b1f58515ff9d4db9470019c630da4df5e.1519915283.git.kurt.bodiker@braintrust-us.com>
	<CACMJ4GYkqBL+zBnqfNOg+iy=7dqJF3EaMf743Wrwd44pQ2hhqA@mail.gmail.com>
	<CACMJ4GbGA+De1quOn_qa4FGNWuPdXmycrUbJcdoCdBzohTfmJA@mail.gmail.com>
From: "Bodiker, Kurt" <kurt.bodiker@braintrust-us.com>
Date: Thu, 22 Mar 2018 12:11:51 -0400
Message-ID: <CAGfCXKFO2Hhp2_BjSAOVqVp6ZUmF+1swYxMPc7EDZGo_JOw=ww@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 1/7] xen: Define the standard values needed for stubdoms
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
X-List-Received-Date: Thu, 22 Mar 2018 16:11:55 -0000
Content-Type: multipart/alternative; boundary="000000000000d05b45056802900a"

--000000000000d05b45056802900a
Content-Type: text/plain; charset="UTF-8"

I think I've come across a better solution than defining a XEN_VERSION
variable that needs maintained. I think this solution is a finer, more
elegant way to accommodate the dependency on a specific Xen version.

First, the xen-vtpm recipe would be defined using Xen version numbers as we
do with the Xen recipe. Instead of the initial recipe for xen-vtpm being
xen-vtpm_1.0.bb, this would now be xen-vtpm_X.X.X.bb (where X.X.X is the
version of Xen we intend to build stubdoms and vTPMs against. Second,
rather than defining Mini-OS in the SRC_URI in stubdom.inc, I would create
a mini-os_X.X.X.bb recipe that would create a source pacakge and
stubdom.inc (or the appropriate recipe) would then include mini-os as a
dependency. Slight manipulation of source dir ($S) would be necessary in
the xen-vtpm recipe, but nothing we can't handle. Again, X.X.X would
reflect the version of Xen we intend to build against.

This would be the version number maintenance outside of the recipe and
allow for easier maintenance. Let me know what you think of this idea and I
can implement it in the next patchset that I will submit.

Kurt

On Tue, Mar 20, 2018 at 2:25 PM, Christopher Clark <
christopher.w.clark@gmail.com> wrote:

>
>
> On Thu, Mar 8, 2018 at 6:23 PM, Christopher Clark <
> christopher.w.clark@gmail.com> wrote:
>
>>
>> On Mon, Mar 5, 2018 at 7:35 AM, Kurt Bodiker <
>> kurt.bodiker@braintrust-us.com> wrote:
>>
>>> From: kebodiker <kurt.bodiker@braintrust-us.com>
>>>
>>> This commit introduces the stubdom.inc file that is required for each
>>> recipe that is/will be built for Xen stubdomains.
>>>
>>
>>
>>
>>> +# Couldn't find any other way to access the version of Xen used as a
>>> dependency.
>>> +# This version number needs changed to match version of Xen recipe
>>> used in builds.
>>> +XEN_VERSION = "4.9.0"
>>>
>>
>>
>> :( I understand the challenge here and sadly I don't have a better
>> recommendation, but: would putting a scope on the DEPEND enable the build
>> to fail fast in case
>> of a mismatch?  ie:
>>
>>     DEPENDS = "xen (= ${XEN_VERSION}-r0)"
>>
>>
> In testing, this constraint of package version doesn't produce the build
> behaviour I was hoping for: bitbake doesn't enforce the version constraint
> at build time and from earlier related posts on the mailing list, this
> behaviour is known, so presumably is intentional.
>
> So: I'll retract the review comment above - ie. there's no need to touch
> DEPENDS - and the XEN_VERSION variable definition going into the stubdom
> recipe seems practical and reasonable.
>
> Christopher
>
>
>


-- 
Kurt Bodiker
BrainTrust Holdings
www.braintrust-us.com
443-296-2186 office
410-750-2119 fax

-- 

*This email and all attachments are considered confidential and the 
proprietary information of BrainTrust Holdings.  Unauthorized disclosure is 
prohibited.  *

--000000000000d05b45056802900a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>I think I&#39;ve come across a better solution t=
han defining a XEN_VERSION variable that needs maintained. I think this sol=
ution is a finer, more elegant way to accommodate the dependency on a speci=
fic Xen version. <br><br>First, the xen-vtpm recipe would be defined using =
Xen version numbers as we do with the Xen recipe. Instead of the initial re=
cipe for xen-vtpm being <a href=3D"http://xen-vtpm_1.0.bb">xen-vtpm_1.0.bb<=
/a>, this would now be <a href=3D"http://xen-vtpm_X.X.X.bb">xen-vtpm_X.X.X.=
bb</a> (where X.X.X is the version of Xen we intend to build stubdoms and v=
TPMs against. Second, rather than defining Mini-OS in the SRC_URI in stubdo=
m.inc, I would create a <a href=3D"http://mini-os_X.X.X.bb">mini-os_X.X.X.b=
b</a> recipe that would create a source pacakge and stubdom.inc (or the app=
ropriate recipe) would then include mini-os as a dependency. Slight manipul=
ation of source dir ($S) would be necessary in the xen-vtpm recipe, but not=
hing we can&#39;t handle. Again, X.X.X would reflect the version of Xen we =
intend to build against.<br>=C2=A0<br></div>This would be the version numbe=
r maintenance outside of the recipe and allow for easier maintenance. Let m=
e know what you think of this idea and I can implement it in the next patch=
set that I will submit.<br><br></div>Kurt<br></div><div class=3D"gmail_extr=
a"><br><div class=3D"gmail_quote">On Tue, Mar 20, 2018 at 2:25 PM, Christop=
her Clark <span dir=3D"ltr">&lt;<a href=3D"mailto:christopher.w.clark@gmail=
.com" target=3D"_blank">christopher.w.clark@gmail.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><span class=3D""><br><d=
iv class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Mar 8, 2018=
 at 6:23 PM, Christopher Clark <span dir=3D"ltr">&lt;<a href=3D"mailto:chri=
stopher.w.clark@gmail.com" target=3D"_blank">christopher.w.clark@gmail.com<=
/a><wbr>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"lt=
r"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><span>On Mon, =
Mar 5, 2018 at 7:35 AM, Kurt Bodiker <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:kurt.bodiker@braintrust-us.com" target=3D"_blank">kurt.bodiker@braintrust=
-us.co<wbr>m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">From: kebodiker &lt;<a href=3D"mailto:kurt.bodiker@braintrust-=
us.com" target=3D"_blank">kurt.bodiker@braintrust-us.co<wbr>m</a>&gt;<br>
<br>
This commit introduces the stubdom.inc file that is required for each<br>
recipe that is/will be built for Xen stubdomains.<br></blockquote><div><br>=
</div><div>=C2=A0</div></span><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">+# Couldn&#39;t find any other way to access the version of Xen used a=
s a dependency.<span><br>
+# This version number needs changed to match version of Xen recipe=C2=A0 u=
sed in builds.<br>
+XEN_VERSION =3D &quot;4.9.0&quot;<br></span></blockquote><div><br></div><d=
iv><br></div><div><div>:( I understand the challenge here and sadly I don&#=
39;t have a better recommendation, but: would putting a scope on the DEPEND=
 enable the build to fail fast in case</div><div>of a mismatch?=C2=A0 ie:</=
div><div><br></div><div>=C2=A0 =C2=A0 DEPENDS =3D &quot;xen (=3D ${XEN_VERS=
ION}-r0)&quot;</div><div><br></div><span class=3D"m_5420655385021489655HOEn=
Zb"></span></div></div></div></div>
</blockquote></div></div><div class=3D"gmail_extra"><br></div></span><div c=
lass=3D"gmail_extra">In testing, this constraint of package version doesn&#=
39;t produce the build behaviour I was hoping for: bitbake doesn&#39;t enfo=
rce the version constraint at build time and from earlier related posts on =
the mailing list, this behaviour is known, so presumably is intentional.</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">So: I&#3=
9;ll retract the review comment above - ie. there&#39;s no need to touch DE=
PENDS - and the XEN_VERSION variable definition going into the stubdom reci=
pe seems practical and reasonable.<span class=3D"HOEnZb"><font color=3D"#88=
8888"><br></font></span></div><span class=3D"HOEnZb"><font color=3D"#888888=
"><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Christoph=
er<br></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
><br></div></font></span></div>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Kurt Bodiker<br=
>BrainTrust Holdings<br><a href=3D"http://www.braintrust-us.com" target=3D"=
_blank">www.braintrust-us.com</a><br><a value=3D"+14434208007">443-296-2186=
</a> office<br><a value=3D"+14107502119">410-750-2119</a> fax</div></div>
</div>

<br>
<br><font size=3D"1"><i>This email and all attachments are considered confi=
dential and the proprietary information of BrainTrust Holdings.=C2=A0 Unaut=
horized disclosure is prohibited.=C2=A0 </i></font><br>

--000000000000d05b45056802900a--
