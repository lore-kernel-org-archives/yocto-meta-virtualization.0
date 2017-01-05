Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D29D2E0049D; Wed,  4 Jan 2017 19:34:57 -0800 (PST)
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
	*      [209.85.220.172 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.172 listed in dnsbl.sorbs.net]
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9A178E00480
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Jan 2017 19:34:56 -0800 (PST)
Received: by mail-qk0-f172.google.com with SMTP id u25so416077416qki.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 04 Jan 2017 19:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MBwK/AArp0qK86A3qTTDIm7w/Ci5MXVUnfQq0RzxzOk=;
	b=Vl7/PFRoOFCr56okkYu4vk0G+VrLC+Bb2duwdTe6iWNI+hXsN/j8aRAcCtY19pUjOR
	xVYjcQRUIWahWLsvRxHBpuDl0h52p2U1S+iqM3+vI9RdKCjhNcUnNiqPW2OXCoIVx2eF
	l/qIWnq7AfWin+JZGnXghe1H4hPJeePHWK1Td3wvLOsGaF8tSlxP9VVL6aQ3brXeql2g
	WSEC4qdtFVdUvLWXd5ULzVjuH5xss4iTtrdBTNtySRoV2KIQCGcbitMLlo1hWUmRxYE+
	n5svg1JE/SQ0aT72s3RNjdvs9v5RdJa6WzZNGsYlmyp3F+BhS3oIQWNhW0HErg0q1Syd
	RBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MBwK/AArp0qK86A3qTTDIm7w/Ci5MXVUnfQq0RzxzOk=;
	b=Pq8sQ42eLjwwyQTjbnDoyZOmHXIAx08MBsNAA0w9N/dfhejH4efypYWr0suSxcv+IM
	9TU9KUiecevzrvl5d1sjxMgqhSy2DQLgIf0w5aOxe7zE/OvYmNxhBvkWUf6JihDxa89a
	LWmmz7krPGtrqW9n2HhXNmqLvh6vYDHF2tnM9z5JsPRVZ3G5Ua+crhWu2Zf42frYB5pP
	fqsNHybcaIq6V4aCv7mIOjgZhQgZ7QK4PThCsucLHrJQi0yQJuKlDWfPi2WYCzUav7ky
	MhvRtxvneUoeo/X2rzhUFkLhXPJOyV4/sIsL98NE2I+LHihDJqlme2Bm66LJDy8gVpq9
	FiXg==
X-Gm-Message-State: AIkVDXIAotWqSivTz91u3K4jzObgDeNkkXo5J7BFbwzi5GTjCzI9rPbvaBbXTIdvScDz8We2HDjFie0LxIP8iQ==
X-Received: by 10.55.190.66 with SMTP id o63mr68431132qkf.254.1483587295767;
	Wed, 04 Jan 2017 19:34:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.129.227 with HTTP; Wed, 4 Jan 2017 19:34:55 -0800 (PST)
In-Reply-To: <CADkTA4MD+oLkJ_5-O9e9uBazXBM_g0G3Exb2Uz8+2vEPTA_N=A@mail.gmail.com>
References: <20170103044754.15012-1-cardoe@cardoe.com>
	<CADkTA4Oc0BCLmhAw7vFLspt4eMN-BAeCEv8ij0cmDuEAUDSUVg@mail.gmail.com>
	<e0ad95d4-a453-d6c1-7ee2-d1fdc7c23072@cardoe.com>
	<CADkTA4MD+oLkJ_5-O9e9uBazXBM_g0G3Exb2Uz8+2vEPTA_N=A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 4 Jan 2017 22:34:55 -0500
Message-ID: <CADkTA4Puo1bP8ENg9SsVQEXV76kasr4OLJ5hYy3Uz+HFpnc0EQ@mail.gmail.com>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-virtualization (krogoth)][PATCH 1/5] xen: switch to updated download URL
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
X-List-Received-Date: Thu, 05 Jan 2017 03:34:57 -0000
Content-Type: multipart/alternative; boundary=94eb2c04395cc1f6f60545509548

--94eb2c04395cc1f6f60545509548
Content-Type: text/plain; charset=UTF-8

All the xen patches should now be merged. Let me know if I managed to muck
up the branches.

cheers,

Bruce

On Tue, Jan 3, 2017 at 11:56 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Tue, Jan 3, 2017 at 11:23 AM, Doug Goldstein <cardoe@cardoe.com> wrote:
>
>> On 1/3/17 9:31 AM, Bruce Ashfield wrote:
>> > You didn't follow up to patch 1 and 2, I assume these are for the same
>> > branches
>> > as patches 3 -> 5 ?
>> >
>> > Bruce
>>
>> No. Actually 1 and 2 are only for krogoth. Sorry for all the confusion.
>> I realize I should have sent this differently for better clarity.
>>
>
> hah. Now that you said that, I see the krogoth in the subject. Post
> holiday brain! :D
>
> Bruce
>
>
>>
>> --
>> Doug Goldstein
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

--94eb2c04395cc1f6f60545509548
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">All the xen patches should now be merged. Let me know if I=
 managed to muck up the branches.<div><br></div><div>cheers,</div><div><br>=
</div><div>Bruce</div></div><div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote">On Tue, Jan 3, 2017 at 11:56 AM, Bruce Ashfield <span dir=3D"ltr=
">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.a=
shfield@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e"><span class=3D"">On Tue, Jan 3, 2017 at 11:23 AM, Doug Goldstein <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:cardoe@cardoe.com" target=3D"_blank">cardo=
e@cardoe.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span>=
On 1/3/17 9:31 AM, Bruce Ashfield wrote:<br>
&gt; You didn&#39;t follow up to patch 1 and 2, I assume these are for the =
same<br>
&gt; branches<br>
&gt; as patches 3 -&gt; 5 ?<br>
&gt;<br>
&gt; Bruce<br>
<br>
</span>No. Actually 1 and 2 are only for krogoth. Sorry for all the confusi=
on.<br>
I realize I should have sent this differently for better clarity.<br></bloc=
kquote><div><br></div></span><div>hah. Now that you said that, I see the kr=
ogoth in the subject. Post holiday brain! :D</div><div><br></div><div>Bruce=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<span class=3D"m_-2929674391032661964HOEnZb"><font color=3D"#888888"><br><s=
pan class=3D"HOEnZb"><font color=3D"#888888">
--<br>
Doug Goldstein<br>
<br>
</font></span></font></span></blockquote></div><span class=3D""><br><br cle=
ar=3D"all"><div><br></div>-- <br><div class=3D"m_-2929674391032661964gmail_=
signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt not follow t=
he NULL pointer, for chaos and madness await thee at its end&quot;</div>
</span></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div>

--94eb2c04395cc1f6f60545509548--
