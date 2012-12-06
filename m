Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0413DE0143A
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 06:12:17 -0800 (PST)
Received: by mail-lb0-f176.google.com with SMTP id k6so5720151lbo.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 06:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=DUjJluYukZr8av6fp20Q46RzVNGVe90mkFx76jBE+bI=;
	b=u9gseBctyXSsyULmlnLEzWdaNZ+LYVIcJ9aKHx5+OBBmiV8GWldZg6f9hz8cWrjeot
	KpC1Yr6Vfs4wjeYjbGUvvAGYhBP8iatjQpM6RiyupzR+tsbfDbQieDCtCWhMBJEZRxvY
	qJrI5aTWsQBBVCBC44Cen3EMwQUrA66C/yNIu9ZH9/B+TSR6n34yY4jDBcq4jlySJ3lW
	B0f08xHWXtxCVBK36Qn0Hv01lS3/7/fHoxLh3UvHfJe75Ef8ru37XKFINBl7RQ7+utF/
	/Ase7gmDM2pyJY4P4J0TCnnjoBKeUWmN1ZkuO+zLnHw7sroVosijKFCQEuFLSBu42bId
	m2qA==
MIME-Version: 1.0
Received: by 10.112.40.129 with SMTP id x1mr978087lbk.95.1354803136852; Thu,
	06 Dec 2012 06:12:16 -0800 (PST)
Received: by 10.114.77.164 with HTTP; Thu, 6 Dec 2012 06:12:16 -0800 (PST)
In-Reply-To: <50C0690D.1080401@enea.com>
References: <97BD068FB200C44AA73C2B641F162ECF8F2AB5@IRSMSX101.ger.corp.intel.com>
	<50BF9906.6080108@se-eng.com> <50C0690D.1080401@enea.com>
Date: Thu, 6 Dec 2012 09:12:16 -0500
Message-ID: <CADkTA4Nij6y=HBpOe8uX8U6etXvydUnWi=cOnSFs9un1dgM96A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: meta-virtualization structure
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
X-List-Received-Date: Thu, 06 Dec 2012 14:12:18 -0000
Content-Type: multipart/alternative; boundary=e0cb4efe323eb673b204d02faf55

--e0cb4efe323eb673b204d02faf55
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 6, 2012 at 4:44 AM, David Nystr=F6m <david.nystrom@enea.com>wro=
te:

>
>
> On 12/05/2012 07:57 PM, Raymond Danks wrote:
>
>> On 12/05/2012 05:02 AM, Prica, Mihai wrote:
>>
>>>
>>> Hi,
>>>
>>> I wanted to include my work with meta-kvm into the new
>>> layer(meta-virtualization) and I was thinking about the best method of
>>> doing this.  The problem is there are different kernel configs
>>> depending on the hypervisor and different values for the PACKAGECONFIG
>>> in libvirt.
>>>
>>> One solution would be to move all the common pieces into a meta layer
>>> and group the hypervisor configurations into a specific directory
>>> (meta-kvm, meta-xen), all of them in meta-virtualization. Is there
>>> another way ?
>>>
>>>
>> It seems to me the choice of hypervisor should be made in the distro
>> configuration.  Can't this be handled with the addition of a HYPERVISOR
>> definition there?
>>
>
> For kernel Kconfig I think this will be a good idea for config options
> which  cannot be set to =3Dm, and are mutually exclusive.
>
>
If we want to stay consistent with the model that we are trying to develop
with
other Yocto and BSP layers it would be nice to come up with some focussed
configuration fragments. These would be available for for re-use and
something
that we can trigger to created tuned kernels for one hypervisor + features
or another.

It's always tempting to create configurations that include lots of items
"just
in case", but for many of the embedded use cases, starting with something
that
is stripped down and building up is what we promote as well, since I know
for
a fact that there are some really tight kernel and disk
space constraints that
will use this configuration.

It also allows the guest and the host to be built from the same base,
varying on
the configs that are required.

I went a bit off topic there, but I can have a look at this once more
changes are
in the tree and come up with some proposals.


> Different values for PACKAGECONF in libvirt for xen/kvm is not neccesaril=
y
> needed, unless your focus is to optimize binary package sizes. libvirt
> drivers for xen/kvm should not be mutually exclusive during
> build/packaging/runtime afaik.
> Trying to use a hypervisor driver in runtime where the underlying tech. i=
s
> not available will result in libvirt runtime errors.
>

I agree with this in many cases, that configuring libvirt to control many
different
backends simulataneously is a good idea and something that I personally use
in my projects.



> Adding specific binary size optimizations flavours, such as xen-minimal
> et.c. of course also be done from DISTRO or local.conf.
>
>
And this make sense to me.

Cheers,

Bruce


>
>
>>  Thanks,
>>>
>>> Mihai
>>>
>>>
>>>
>>> ______________________________**_________________
>>> meta-virtualization mailing list
>>> meta-virtualization@**yoctoproject.org<meta-virtualization@yoctoproject=
.org>
>>> https://lists.yoctoproject.**org/listinfo/meta-**virtualization<https:/=
/lists.yoctoproject.org/listinfo/meta-virtualization>
>>>
>>
>>
>>
>>
>> ______________________________**_________________
>> meta-virtualization mailing list
>> meta-virtualization@**yoctoproject.org<meta-virtualization@yoctoproject.=
org>
>> https://lists.yoctoproject.**org/listinfo/meta-**virtualization<https://=
lists.yoctoproject.org/listinfo/meta-virtualization>
>>
>>  ______________________________**_________________
> meta-virtualization mailing list
> meta-virtualization@**yoctoproject.org<meta-virtualization@yoctoproject.o=
rg>
> https://lists.yoctoproject.**org/listinfo/meta-**virtualization<https://l=
ists.yoctoproject.org/listinfo/meta-virtualization>
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--e0cb4efe323eb673b204d02faf55
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Thu, D=
ec 6, 2012 at 4:44 AM, David Nystr=F6m <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:david.nystrom@enea.com" target=3D"_blank">david.nystrom@enea.com</a>&gt=
;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div><br>
<br>
On 12/05/2012 07:57 PM, Raymond Danks wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On 12/05/2012 05:02 AM, Prica, Mihai wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Hi,<br>
<br>
I wanted to include my work with meta-kvm into the new<br>
layer(meta-virtualization) and I was thinking about the best method of<br>
doing this. =A0The problem is there are different kernel configs<br>
depending on the hypervisor and different values for the PACKAGECONFIG<br>
in libvirt.<br>
<br>
One solution would be to move all the common pieces into a meta layer<br>
and group the hypervisor configurations into a specific directory<br>
(meta-kvm, meta-xen), all of them in meta-virtualization. Is there<br>
another way ?<br>
<br>
</blockquote>
<br>
It seems to me the choice of hypervisor should be made in the distro<br>
configuration. =A0Can&#39;t this be handled with the addition of a HYPERVIS=
OR<br>
definition there?<br>
</blockquote>
<br></div>
For kernel Kconfig I think this will be a good idea for config options whic=
h =A0cannot be set to =3Dm, and are mutually exclusive.<br>
<br></blockquote><div><br></div><div>If we want to stay consistent with the=
 model that we are trying to develop with<br></div><div>other Yocto and BSP=
 layers it would be nice to come up with some focussed</div><div>configurat=
ion fragments. These would be available for for re-use and something</div>
<div>that we can=A0trigger to created tuned kernels for one hypervisor + fe=
atures or another.</div><div><br></div><div>It&#39;s always tempting to cre=
ate configurations that include lots of items &quot;just</div><div>in case&=
quot;, but for many of the embedded use cases, starting with something that=
</div>

<div>is stripped down and building up is what we promote as well, since I k=
now for=A0</div><div>a fact that there are some really tight kernel and dis=
k space=A0constraints=A0that</div><div>will use this configuration.</div><d=
iv>
<br></div><div>It also allows the guest and the host to be built from the s=
ame base, varying on</div><div>the configs that are required.</div><div><br=
></div><div>I went a bit off topic there, but I can have a look at this onc=
e more changes are</div>
<div>in the tree and come up with some proposals.</div><div>=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
Different values for PACKAGECONF in libvirt for xen/kvm is not neccesarily =
needed, unless your focus is to optimize binary package sizes. libvirt driv=
ers for xen/kvm should not be mutually exclusive during build/packaging/run=
time afaik.<br>



Trying to use a hypervisor driver in runtime where the underlying tech. is =
not available will result in libvirt runtime errors.<br></blockquote><div><=
br></div><div>I agree with this in many cases, that configuring libvirt to =
control many different</div>
<div>backends simulataneously is a good idea and something that I personall=
y use</div><div>in my projects.</div><div><br></div><div><br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">

<br>
Adding specific binary size optimizations flavours, such as xen-minimal et.=
c. of course also be done from DISTRO or local.conf.<div><div><br></div></d=
iv></blockquote><div><br></div><div>And this make sense to me.</div><div>
<br></div><div>Cheers,</div><div><br></div><div>Bruce</div><div>=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><div><div>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Thanks,<br>
<br>
Mihai<br>
<br>
<br>
<br>
______________________________<u></u>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@<u></u>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.<u></u>org/listinfo/meta-<u></u>v=
irtualization</a><br>
</blockquote>
<br>
<br>
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
______________________________<u></u>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@<u></u>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.<u></u>org/listinfo/meta-<u></u>v=
irtualization</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end&quot;<br>
</div>

--e0cb4efe323eb673b204d02faf55--
