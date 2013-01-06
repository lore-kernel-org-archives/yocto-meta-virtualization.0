Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7CE97E01404
	for <meta-virtualization@yoctoproject.org>;
	Sun,  6 Jan 2013 07:48:12 -0800 (PST)
Received: by mail-la0-f48.google.com with SMTP id ej20so12991629lab.7
	for <meta-virtualization@yoctoproject.org>;
	Sun, 06 Jan 2013 07:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=dcsTCzKUtNIWzxc0d6gPC6elfswhTqutGG1Sq9DMbBw=;
	b=F0MsJuPn20YKQvuBwSPjPTXyfd3q8frG4rC2WoD6VFGiBjS2aN50DqC7W4/VLThgwP
	Zl+N6Ig+/asntLJVj5i/zEDzDyp6oltf1tirA13ffAvidMAU2wcC4ZeEF66kK3ECykt4
	eH0pWC8HUpscqhswdbhpQNnFe2CV2Vg9k0R106r3Gqk8dOZ1iiLzECQ81fqpS44YXwbY
	N64XHxiwVQU4PpXNmDU9Ccz2GgAy1tSd6J+PhCJPlTtQ+hL5ZmzqppOjjDmBx4gELsbn
	4mtzUYQfFKBoW5SOVRY9gkzr/0mPUmtha7RZttbCaXmVckfH08pRXlKsPedvRLk8cmr7
	0pOQ==
MIME-Version: 1.0
Received: by 10.152.145.8 with SMTP id sq8mr54877844lab.21.1357487290692; Sun,
	06 Jan 2013 07:48:10 -0800 (PST)
Received: by 10.112.127.35 with HTTP; Sun, 6 Jan 2013 07:48:10 -0800 (PST)
In-Reply-To: <50E9751B.6020808@gmail.com>
References: <1357393406-11707-1-git-send-email-lei.yang@windriver.com>
	<50E830EF.6030102@gmail.com>
	<CAHsH0E8wu6gn4bnqiDr8AtexVc7kq4zdL3jVWWzOOnqx1zMrZQ@mail.gmail.com>
	<50E83CC7.60608@enea.com>
	<CADkTA4Mx6EQGPb2c7qgjQ0eqQ0P4eFyxnTj38nB2gN=z5KY29Q@mail.gmail.com>
	<50E9751B.6020808@gmail.com>
Date: Sun, 6 Jan 2013 10:48:10 -0500
Message-ID: <CADkTA4MWK9n+YSQnh=DZLBcuy4JJT1Ppgm7n4qEHjEbkfiQ7tg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] Update the netcat with debian patches to fix some error
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
X-List-Received-Date: Sun, 06 Jan 2013 15:48:12 -0000
Content-Type: multipart/alternative; boundary=e89a8f22bc29bfb4a104d2a0a38d

--e89a8f22bc29bfb4a104d2a0a38d
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 6, 2013 at 7:59 AM, David Nystr=F6m <david.c.nystrom@gmail.com>=
wrote:

> On 01/05/2013 07:44 PM, Bruce Ashfield wrote:
>
>> On Sat, Jan 5, 2013 at 9:46 AM, David Nystr=F6m <david.nystrom@enea.com
>> >wrote:
>>
>>
>>>
>>> On 01/05/2013 03:26 PM, lei yang wrote:
>>>
>>>  On Sat, Jan 5, 2013 at 5:55 AM, David Nystr=F6m <
>>>> david.c.nystrom@gmail.com>
>>>> wrote:
>>>>
>>>>  On 01/05/2013 02:43 PM, lei.yang@windriver.com wrote:
>>>>>
>>>>>
>>>>>> From: Lei Yang <lei.yang@windriver.com>
>>>>>>
>>>>>>  I think we should hold on this merge completely. netcat is already
>> covered
>> by meta-networking, so
>> we should be consolidating patches and support there.
>>
>> If there are any specific meta-virt requirements for netcat, we should
>> either use bbappends (and
>> depend on meta-networking, or use the combo-layer tools to pull the
>> support
>> directly) or better yet
>> get them merged into meta-networking.
>>
>> Cheers,
>>
>> Bruce
>>
>>
> I'm totaly OK with this, as long as its accepted somewhere.
> As Lei states though, we need to document the layer setup in README.
>
>
+1


> However, for future reference, I see no reason why new recipes can't end
> up in meta-virtualization first for a usable working setup, and when
> accepted upstream, they will be removed.
> I suggest we use recipes-external/meta-<**potential-upstream-here>/new-**=
recipe-name/
> until accepted elsewhere.
>

I don't disagree with this process either, but I wouldn't want it to become
the first choice
of a recipe flow. It creates more churn and work to bounce through a
temporary location
rather than going directly to where things belong.

If we have trouble getting a recipe accepted elsewhere, the choice of
another layer isn't
obvious, or there's a real time pressure, I'd completely agree that this is
the right thing
to do.

It's just that in this case, the flow to meta-networking is fairly obvious
(to me at least)
and there's no time pressure .. so trying to get it into meta-networking
first was a good
idea.

Cheers,

Bruce


>
> Br,
> David
>
>
>>
>> ______________________________**_________________
>> meta-virtualization mailing list
>> meta-virtualization@**yoctoproject.org<meta-virtualization@yoctoproject.=
org>
>> https://lists.yoctoproject.**org/listinfo/meta-**virtualization<https://=
lists.yoctoproject.org/listinfo/meta-virtualization>
>>
>>
>


--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--e89a8f22bc29bfb4a104d2a0a38d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Sun, Jan 6, 2013 at 7:59 AM, David Nystr=F6m <span dir=3D"ltr">&=
lt;<a href=3D"mailto:david.c.nystrom@gmail.com" target=3D"_blank">david.c.n=
ystrom@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 01/05/2013 07:44 PM, Br=
uce Ashfield wrote:<br>
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div class=3D"im">
On Sat, Jan 5, 2013 at 9:46 AM, David Nystr=F6m &lt;<a href=3D"mailto:david=
.nystrom@enea.com" target=3D"_blank">david.nystrom@enea.com</a>&gt;wrote:<b=
r>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
<br>
On 01/05/2013 03:26 PM, lei yang wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Sat, Jan 5, 2013 at 5:55 AM, David Nystr=F6m &lt;<a href=3D"mailto:david=
.c.nystrom@gmail.com" target=3D"_blank">david.c.nystrom@gmail.com</a>&gt;<b=
r>
wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On 01/05/2013 02:43 PM, <a href=3D"mailto:lei.yang@windriver.com" target=3D=
"_blank">lei.yang@windriver.com</a> wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
From: Lei Yang &lt;<a href=3D"mailto:lei.yang@windriver.com" target=3D"_bla=
nk">lei.yang@windriver.com</a>&gt;<br>
<br>
</blockquote></blockquote></blockquote></blockquote></div><div class=3D"im"=
>
I think we should hold on this merge completely. netcat is already covered<=
br>
by meta-networking, so<br>
we should be consolidating patches and support there.<br>
<br>
If there are any specific meta-virt requirements for netcat, we should<br>
either use bbappends (and<br>
depend on meta-networking, or use the combo-layer tools to pull the support=
<br>
directly) or better yet<br>
get them merged into meta-networking.<br>
<br>
Cheers,<br>
<br>
Bruce<br>
<br>
</div></blockquote>
<br>
I&#39;m totaly OK with this, as long as its accepted somewhere.<br>
As Lei states though, we need to document the layer setup in README.<br>
<br></blockquote><div><br></div><div>+1</div><div>=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">
However, for future reference, I see no reason why new recipes can&#39;t en=
d up in meta-virtualization first for a usable working setup, and when acce=
pted upstream, they will be removed.<br>
I suggest we use recipes-external/meta-&lt;<u></u>potential-upstream-here&g=
t;/new-<u></u>recipe-name/ until accepted elsewhere.<br></blockquote><div><=
br></div><div style>I don&#39;t disagree with this process either, but I wo=
uldn&#39;t want it to become the first choice</div>
<div style>of a recipe flow. It creates more churn and work to bounce throu=
gh a temporary location</div><div style>rather than going directly to where=
 things belong.</div><div style><br></div><div style>If we have trouble get=
ting a recipe accepted elsewhere, the choice of another layer isn&#39;t</di=
v>
<div style>obvious, or there&#39;s a real time pressure, I&#39;d completely=
 agree that this is the right thing</div><div style>to do.=A0</div><div sty=
le><br></div><div style>It&#39;s just that in this case, the flow to meta-n=
etworking is fairly obvious (to me at=A0least)</div>
<div style>and there&#39;s no time pressure .. so trying to get it into met=
a-networking first was a good</div><div style>idea.</div><div style><br></d=
iv><div style>Cheers,</div><div style><br></div><div style>Bruce=A0</div>
<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
<br>
Br,<br>
David<div class=3D"HOEnZb"><div class=3D"h5"><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
<br>
______________________________<u></u>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@<u></u>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.<u></u>org/listinfo/meta-<u></u>v=
irtualization</a><br>
<br>
</blockquote>
<br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end&quot;
</div></div>

--e89a8f22bc29bfb4a104d2a0a38d--
