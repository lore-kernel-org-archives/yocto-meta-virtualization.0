Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 57131E00CA1; Tue, 20 Mar 2018 11:26:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.182 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DFC75E00529
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Mar 2018 11:26:02 -0700 (PDT)
Received: by mail-qk0-f182.google.com with SMTP id s188so2746307qkb.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Mar 2018 11:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NuLo2ozBP/PoaKYB6PQ5zNve44aXIFq3GReJvH33ijg=;
	b=sg1BpqCIRMKOqNhxsOKuZCaMTT2cFl3ERK7YqJP5c67UUILVW4RSLEFVyumkgpjcxR
	EXgER/bPZUktXs5OU37WoPZreQ5az49bSrLzzJYK/OnpVwQbiRBD3zhrDOIwmKOmA1Cq
	tjF9LVvycd6Ug+c4z9h4xHzbUbffIIvKs0HJYNZoa3W/8rUeU471l2HKUp2AkVt7jDNT
	IWrsSEIa6Y5IAm/zMlm/yy3D/8GlPhG50oykQ61IuiIzmmH3wDXU3rRHldqXN5oFcHz2
	qPHX7AzEZaBZHjwnThQ4nIpUwFpLdoHUHoqbToLBn+O7dzD8jo0fTF8EL5o6stwinT2Y
	vwtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NuLo2ozBP/PoaKYB6PQ5zNve44aXIFq3GReJvH33ijg=;
	b=LWyujMTu7s6UO8FqMHl+2B39L2kV2O45ptveIF7VCiM5o3xGK0JZ7eL/Wtb9siuq25
	txGyr8jldCiAitsz8pu8tlZji5fo7gI+qgIpodHUsnci6YQSSHcmWj+JMf2eGP9RCX0z
	bn5fbyvzSR5vJZqA+X33ysmoDT8T7Wpw4KW59rV22YEVb1+uizoFJULcL7VgLlkt6fQp
	PdDffzSHYrME5RSJBn+40xlI6Ar0Y5mbOgczr9VjhGru8Pb/9C0VywW6q6yzOJc6e+Ui
	hGX3D/MvvY9f3nfmguMAmWJzK+3eglao2nGu+iLjBTfk+y8sDKhKclUjre+6MCQWyrgh
	5pKQ==
X-Gm-Message-State: AElRT7HdbrLbTrYRVdXaWnQNlsGeIraAjB0fMzDVV3y06oKu20SPYmHy
	zrix+iHZgokWf5dTS2WVU/qDf8mV6KFTBNePDruBcA==
X-Google-Smtp-Source: AG47ELsg3Czy2AJLbM7qipVHDwz06+JbKEWXIriEJG5J7CAXbIwsVmMR3GXuGQQEYViKRL7RcCi5/gJmlSG1FYTmfYY=
X-Received: by 10.55.163.136 with SMTP id m130mr24813468qke.339.1521570361941; 
	Tue, 20 Mar 2018 11:26:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.135.144 with HTTP; Tue, 20 Mar 2018 11:25:37 -0700 (PDT)
In-Reply-To: <CACMJ4GYkqBL+zBnqfNOg+iy=7dqJF3EaMf743Wrwd44pQ2hhqA@mail.gmail.com>
References: <cover.1519915283.git.kurt.bodiker@braintrust-us.com>
	<d59c1a4b1f58515ff9d4db9470019c630da4df5e.1519915283.git.kurt.bodiker@braintrust-us.com>
	<CACMJ4GYkqBL+zBnqfNOg+iy=7dqJF3EaMf743Wrwd44pQ2hhqA@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Tue, 20 Mar 2018 11:25:37 -0700
Message-ID: <CACMJ4GbGA+De1quOn_qa4FGNWuPdXmycrUbJcdoCdBzohTfmJA@mail.gmail.com>
To: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
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
X-List-Received-Date: Tue, 20 Mar 2018 18:26:04 -0000
Content-Type: multipart/alternative; boundary="94eb2c05bc68eca0df0567dc345f"

--94eb2c05bc68eca0df0567dc345f
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 8, 2018 at 6:23 PM, Christopher Clark <
christopher.w.clark@gmail.com> wrote:

>
> On Mon, Mar 5, 2018 at 7:35 AM, Kurt Bodiker <kurt.bodiker@braintrust-us.
> com> wrote:
>
>> From: kebodiker <kurt.bodiker@braintrust-us.com>
>>
>> This commit introduces the stubdom.inc file that is required for each
>> recipe that is/will be built for Xen stubdomains.
>>
>
>
>
>> +# Couldn't find any other way to access the version of Xen used as a
>> dependency.
>> +# This version number needs changed to match version of Xen recipe  used
>> in builds.
>> +XEN_VERSION = "4.9.0"
>>
>
>
> :( I understand the challenge here and sadly I don't have a better
> recommendation, but: would putting a scope on the DEPEND enable the build
> to fail fast in case
> of a mismatch?  ie:
>
>     DEPENDS = "xen (= ${XEN_VERSION}-r0)"
>
>
In testing, this constraint of package version doesn't produce the build
behaviour I was hoping for: bitbake doesn't enforce the version constraint
at build time and from earlier related posts on the mailing list, this
behaviour is known, so presumably is intentional.

So: I'll retract the review comment above - ie. there's no need to touch
DEPENDS - and the XEN_VERSION variable definition going into the stubdom
recipe seems practical and reasonable.

Christopher

--94eb2c05bc68eca0df0567dc345f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Mar 8, 2018 at 6:23 PM, Christopher Clark <span dir=3D"ltr">&lt=
;<a href=3D"mailto:christopher.w.clark@gmail.com" target=3D"_blank">christo=
pher.w.clark@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te"><span class=3D"">On Mon, Mar 5, 2018 at 7:35 AM, Kurt Bodiker <span dir=
=3D"ltr">&lt;<a href=3D"mailto:kurt.bodiker@braintrust-us.com" target=3D"_b=
lank">kurt.bodiker@braintrust-us.<wbr>com</a>&gt;</span> wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">From: kebodiker &lt;<a href=3D"ma=
ilto:kurt.bodiker@braintrust-us.com" target=3D"_blank">kurt.bodiker@braintr=
ust-us.co<wbr>m</a>&gt;<br>
<br>
This commit introduces the stubdom.inc file that is required for each<br>
recipe that is/will be built for Xen stubdomains.<br></blockquote><div><br>=
</div><div>=C2=A0</div></span><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">+# Couldn&#39;t find any other way to access the version of Xen used a=
s a dependency.<span class=3D""><br>
+# This version number needs changed to match version of Xen recipe=C2=A0 u=
sed in builds.<br>
+XEN_VERSION =3D &quot;4.9.0&quot;<br></span></blockquote><div><br></div><d=
iv><br></div><div><div>:( I understand the challenge here and sadly I don&#=
39;t have a better recommendation, but: would putting a scope on the DEPEND=
 enable the build to fail fast in case</div><div>of a mismatch?=C2=A0 ie:</=
div><div><br></div><div>=C2=A0 =C2=A0 DEPENDS =3D &quot;xen (=3D ${XEN_VERS=
ION}-r0)&quot;</div><div><br></div><span class=3D"HOEnZb"></span></div></di=
v></div></div>
</blockquote></div></div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">In testing, this constraint of package version doesn&#39;t pr=
oduce the build behaviour I was hoping for: bitbake doesn&#39;t enforce the=
 version constraint at build time and from earlier related posts on the mai=
ling list, this behaviour is known, so presumably is intentional.</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">So: I&#39;ll re=
tract the review comment above - ie. there&#39;s no need to touch DEPENDS -=
 and the XEN_VERSION variable definition going into the stubdom recipe seem=
s practical and reasonable.<br></div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">Christopher<br></div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra"><br></div></div>

--94eb2c05bc68eca0df0567dc345f--
