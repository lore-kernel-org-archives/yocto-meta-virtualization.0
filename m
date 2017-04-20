Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 140C8E00939; Thu, 20 Apr 2017 05:29:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B061EE0083C
	for <meta-virtualization@yoctoproject.org>;
	Thu, 20 Apr 2017 05:29:37 -0700 (PDT)
Received: by mail-oi0-f52.google.com with SMTP id y11so16554183oie.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 20 Apr 2017 05:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DUEQFlF0X5TfTftbDGHkhWyr8iokjBQv6a8OUKGqU98=;
	b=PXLLxHDpVIu7PXqcxxYxr1Igy2aESzDa/pu8bGIoDZiUHTf+AqEwpL63vxW0mEwMm3
	FwuMSFExHzRQI27vKom0kPfIbVz4FjgMlP1VgLTGkftQXC8EQajsGtPGSP7sQD1pzn7s
	dKlhzhEKM5Jj8CTC/sIFsOt4Z46ttLpHpPqWqF7hes0r2OfiZcSjTcnDZVA3cggMZfJm
	b0XWRs0mJmSAfsar3YFL+HySaPdwi940cA/zdacODE2+4V3QWfyICELTZoUw7Tp2fOFI
	0gIApnYlwcN4xtsbMyCOoRKq5A/7Ym5GXzq4k42sFVLDOtjw3AuU1UsV3MTdUCJM/jzq
	wPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DUEQFlF0X5TfTftbDGHkhWyr8iokjBQv6a8OUKGqU98=;
	b=WLfoJ02zdvDd4orR8plDi0y8247qzxvvAZd92sCVvzcX1AJDyFYYGJG/8fNDQU5TqR
	0UD4wCDTsUQsUoz8zNYi374n6DsZNk5oJMeddt7NztWiY/bbRSFgCiK7+CbSP+EhJCgD
	oTunDbydz5ncnuSAsiuCL9khAK2ympZkFwcsFLtPDTSGpB0/x99FmnyENFptwuJABInM
	IlbOPjTcVqjo8mrkcbxXD34WL3t0bDKGcz1mRGa/VlzMWOGlvCdLUp3sV/PkjUWS+pgd
	TJ5oupGDxD8oxOZoGPgiktfk9fHOMWAlBYY9llMDqq+i3lEjmS3sq+wQOW8ahxWidbag
	ulSQ==
X-Gm-Message-State: AN3rC/4duL1BbJBHHVyEevDCDVRqK/+OFo5jFkhRtFB2ZJz/BxxzBmsK
	cpstsfF8ozLc4Ls8v/AIoX+ytq/cOjOX
X-Received: by 10.202.192.70 with SMTP id q67mr3973763oif.66.1492691376662;
	Thu, 20 Apr 2017 05:29:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.82.172 with HTTP; Thu, 20 Apr 2017 05:29:36 -0700 (PDT)
In-Reply-To: <CADkTA4NeNWuUqvLiXo0otRrgZmpHk2Qm873H3_0oQLAe6z7xeA@mail.gmail.com>
References: <8f017b80-eeff-457f-0769-43301ff38d5f@gmail.com>
	<CADkTA4NeNWuUqvLiXo0otRrgZmpHk2Qm873H3_0oQLAe6z7xeA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 20 Apr 2017 08:29:36 -0400
Message-ID: <CADkTA4OwwejtzsqqpfVvbChdz=LT=-oKnjS4LGiE2UtiDbt4EQ@mail.gmail.com>
To: Christian Holl <cyborgx1@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Can we have a standard approach for Go?
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
X-List-Received-Date: Thu, 20 Apr 2017 12:29:41 -0000
Content-Type: multipart/alternative; boundary=001a113dd08a43f05b054d984b67

--001a113dd08a43f05b054d984b67
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 20, 2017 at 8:19 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Thu, Apr 20, 2017 at 6:58 AM, Christian Holl <cyborgx1@gmail.com>
> wrote:
>
>> Hi,
>>
>> I saw that there is a implementation of Go inside
>> meta-virtualization.
>>
>>
>> I am currently trying to build influxdb, telegraf and grafana for my
>> rasberrypi.
>>
>> And telegraf depends on docker. Which is also written in Go.
>>
>> But I am using oe-meta-go for other recipes and they don't work together.
>>
>> So there is  meta-golang, oe-meta-go and meta-virtualization with go
>> implementations.
>>
>
> This process is already done in master. I was part of the discussions on
> moving
> go to oe-core at ELCe in berlin, and Khem took the initiative and
> collected our
> go changes + oe-meta-go + meta-golang and got them merged into oe-core
> for the upcoming 2.3 release.
>
> Those changes won't be backported, but from the 2.3 release and on, we are
> moving to the oe-core go variant.
>

And I'll post my reply from that other thread here as well:

---------------------------

As for the build infrastructure, we are standardized on the oe-core go
version.

As for the actual go dependency recipes, they are going to stay in their
respective layers for a while.

Having recipes collected in layers "by language" doesn't solve the
dependency problem. We have system level use cases in
meta-virtualization/meta-cloud-services that require specific versions of
dependent packages, and those are the recipes that are captured in the
layers.

A generic, language layer of dependencies marches forward at a cadence that
can continually break those dependencies. So if it really matters, we need
to capture the recipe in the layer (i.e. meta-virt) where it is actually
tested (and not just dropped into the bucket).

There's a separate discussion on the oe architecture list on how to handle
languages that fetch their own dependencies up front (go, node.js, etc),
and that is where the dependency problem is going to be solved. Packaging
the (potentially) thousands of dependency packages isn't the solution,
managing the fetch and build process is likely the way to go .. but read
the thread for the thoughts and details if there's interest.
-----------------------------

Bruce


> Cheers,
>
> Bruce
>
>
>>
>>
>> So could you maybe could someone responsible join our discussion, what to
>> use:
>>
>> https://github.com/madisongh/meta-golang/issues/12
>>
>>
>> Kind Regards,
>>
>> Christian
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113dd08a43f05b054d984b67
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Apr 20, 2017 at 8:19 AM, Bruce Ashfield <span dir=3D"ltr">&lt;<=
a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield=
@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote"><span class=3D"gmail-">On Thu, Apr 20, 2017 at 6:58 AM, Ch=
ristian Holl <span dir=3D"ltr">&lt;<a href=3D"mailto:cyborgx1@gmail.com" ta=
rget=3D"_blank">cyborgx1@gmail.com</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
I saw that there is a implementation of Go inside<br>
meta-virtualization.<br>
<br>
<br>
I am currently trying to build influxdb, telegraf and grafana for my<br>
rasberrypi.<br>
<br>
And telegraf depends on docker. Which is also written in Go.<br>
<br>
But I am using oe-meta-go for other recipes and they don&#39;t work togethe=
r.<br>
<br>
So there is=C2=A0 meta-golang, oe-meta-go and meta-virtualization with go<b=
r>
implementations.<br></blockquote><div><br></div></span><div>This process is=
 already done in master. I was part of the discussions on moving</div><div>=
go to oe-core at ELCe in berlin, and Khem took the initiative and collected=
 our</div><div>go changes + oe-meta-go + meta-golang and got them merged in=
to oe-core</div><div>for the upcoming 2.3 release.</div><div><br></div><div=
>Those changes won&#39;t be backported, but from the 2.3 release and on, we=
 are</div><div>moving to the oe-core go variant.</div></div></div></div></b=
lockquote><div><br></div><div>And I&#39;ll post my reply from that other th=
read here as well:</div><div><br></div><div>---------------------------</di=
v><div><p style=3D"box-sizing:border-box;margin-bottom:16px;color:rgb(36,41=
,46);font-family:-apple-system,system-ui,&quot;segoe ui&quot;,helvetica,ari=
al,sans-serif,&quot;apple color emoji&quot;,&quot;segoe ui emoji&quot;,&quo=
t;segoe ui symbol&quot;;font-size:14px;margin-top:0px">As for the build inf=
rastructure, we are standardized on the oe-core go version.</p><p style=3D"=
box-sizing:border-box;margin-top:0px;margin-bottom:16px;color:rgb(36,41,46)=
;font-family:-apple-system,system-ui,&quot;segoe ui&quot;,helvetica,arial,s=
ans-serif,&quot;apple color emoji&quot;,&quot;segoe ui emoji&quot;,&quot;se=
goe ui symbol&quot;;font-size:14px">As for the actual go dependency recipes=
, they are going to stay in their respective layers for a while.</p><p styl=
e=3D"box-sizing:border-box;margin-top:0px;margin-bottom:16px;color:rgb(36,4=
1,46);font-family:-apple-system,system-ui,&quot;segoe ui&quot;,helvetica,ar=
ial,sans-serif,&quot;apple color emoji&quot;,&quot;segoe ui emoji&quot;,&qu=
ot;segoe ui symbol&quot;;font-size:14px">Having recipes collected in layers=
 &quot;by language&quot; doesn&#39;t solve the dependency problem. We have =
system level use cases in meta-virtualization/meta-cloud-services that requ=
ire specific versions of dependent packages, and those are the recipes that=
 are captured in the layers.</p><p style=3D"box-sizing:border-box;margin-to=
p:0px;margin-bottom:16px;color:rgb(36,41,46);font-family:-apple-system,syst=
em-ui,&quot;segoe ui&quot;,helvetica,arial,sans-serif,&quot;apple color emo=
ji&quot;,&quot;segoe ui emoji&quot;,&quot;segoe ui symbol&quot;;font-size:1=
4px">A generic, language layer of dependencies marches forward at a cadence=
 that can continually break those dependencies. So if it really matters, we=
 need to capture the recipe in the layer (i.e. meta-virt) where it is actua=
lly tested (and not just dropped into the bucket).</p><p style=3D"box-sizin=
g:border-box;margin-top:0px;color:rgb(36,41,46);font-family:-apple-system,s=
ystem-ui,&quot;segoe ui&quot;,helvetica,arial,sans-serif,&quot;apple color =
emoji&quot;,&quot;segoe ui emoji&quot;,&quot;segoe ui symbol&quot;;font-siz=
e:14px;margin-bottom:0px">There&#39;s a separate discussion on the oe archi=
tecture list on how to handle languages that fetch their own dependencies u=
p front (go, node.js, etc), and that is where the dependency problem is goi=
ng to be solved. Packaging the (potentially) thousands of dependency packag=
es isn&#39;t the solution, managing the fetch and build process is likely t=
he way to go .. but read the thread for the thoughts and details if there&#=
39;s interest.</p></div><div>-----------------------------</div><div><br></=
div><div>Bruce=C2=A0</div><div><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"g=
mail_quote"><div><br></div><div>Cheers,</div><div><br></div><div>Bruce</div=
><span class=3D"gmail-"><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<br>
<br>
So could you maybe could someone responsible join our discussion, what to u=
se:<br>
<br>
<a href=3D"https://github.com/madisongh/meta-golang/issues/12" rel=3D"noref=
errer" target=3D"_blank">https://github.com/madisongh/m<wbr>eta-golang/issu=
es/12</a><br>
<br>
<br>
Kind Regards,<br>
<br>
Christian<span class=3D"gmail-m_-3309055153735626141HOEnZb"><font color=3D"=
#888888"><br>
<br>
-- <br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproje<wbr>ct.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org<wbr>/listi=
nfo/meta-virtualization</a><br>
</font></span></blockquote></span></div><span class=3D"gmail-HOEnZb"><font =
color=3D"#888888"><br><br clear=3D"all"><div><br></div>-- <br><div class=3D=
"gmail-m_-3309055153735626141gmail_signature">&quot;Thou shalt not follow t=
he NULL pointer, for chaos and madness await thee at its end&quot;</div>
</font></span></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for chao=
s and madness await thee at its end&quot;</div>
</div></div>

--001a113dd08a43f05b054d984b67--
