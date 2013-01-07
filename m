Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-da0-f44.google.com (mail-da0-f44.google.com
	[209.85.210.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 46BBDE00724
	for <meta-virtualization@yoctoproject.org>;
	Mon,  7 Jan 2013 10:10:42 -0800 (PST)
Received: by mail-da0-f44.google.com with SMTP id z20so8775985dae.31
	for <meta-virtualization@yoctoproject.org>;
	Mon, 07 Jan 2013 10:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=BTaQb1n3smL5MG0aZNe3BNtX+qOyAlbZYudt0bSX/Rw=;
	b=uBbfukmmGgR7Y8RgvDEX845sjd80AvLAcnLELmp4B1WQwnqQFRozxpH6FZPRaybljt
	IW+PsIvlHWVs/OUQ9aSLtU5OuX5QQ7EyLIHI4Q7qxpzjQhB+2EejhJ5mSqnEbGRKlIpg
	bsypKtLz7pW+KC1EJoUlB/zGEOtVjBvMDIBLGnnyW0UWQBYEjFRwlNr+UQbZL35ihrvE
	37akYmOesh0LZxeFy0GY9rBHH49kTdQOUls03h37IwPrdlz1oVxLTzpWAnZIjIiaXKAQ
	NmMm7PaXGcohollRMALRmoVuDpsN/yUDc20ppJttzicqbwUs2HtcEFQkzUv8D1ZU5/Mk
	rJcw==
MIME-Version: 1.0
Received: by 10.68.223.35 with SMTP id qr3mr190192788pbc.27.1357582242059;
	Mon, 07 Jan 2013 10:10:42 -0800 (PST)
Received: by 10.68.1.68 with HTTP; Mon, 7 Jan 2013 10:10:41 -0800 (PST)
In-Reply-To: <50EB053F.2040809@se-eng.com>
References: <1357560505-24122-1-git-send-email-mihai.prica@intel.com>
	<1357560505-24122-2-git-send-email-mihai.prica@intel.com>
	<50EB053F.2040809@se-eng.com>
Date: Mon, 7 Jan 2013 13:10:41 -0500
Message-ID: <CADkTA4NfJq0e-Kcg99uotS1O5ny0uQw=VVmKV0yxwwoMxqdNuw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Raymond Danks <ray.danks@se-eng.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/2] linux-yocto: added kernel configuration for KVM
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
X-List-Received-Date: Mon, 07 Jan 2013 18:10:42 -0000
Content-Type: multipart/alternative; boundary=047d7b1630894a93df04d2b6bfd1

--047d7b1630894a93df04d2b6bfd1
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 7, 2013 at 12:26 PM, Raymond Danks <ray.danks@se-eng.com> wrote:

> I'm going to show my lack of knowledge in this area, but I know this is
> going to come up when I push a xen.cfg that I apparently never added.
>
> Is it possible to do something along the lines of PACKAGE_CONFIG in the
> linux-yocto.bbappend?  For example, in the libvirt package one can use
> PACKAGE_CONFIG to construct a "minimal" build of libvirt.  What would be
> the method for one to do the same in this package?
>

kernel configuration fragment use are controlled via the KERNEL_FEATURES
variable, and
for anything pre-yocto 1.4 that means an in-tree kernel configuration
fragment (I'm still pushing
for the fragments to be maintained in tree, since that allows them to be
reused and maintained
more easily).

KERNEL_FEATURES is managed like any other variable in the system, including
updating
it via optional/dynamic features as we see fit.


> Yes, I imagine that worst case there can be a SRC_URI_distro definition
> that includes only the .scc files required for that "minimal" image build,
> but it seems like we want to keep away from that as much as possible being
> that this isn't a distro layer.
>
>
Typically we do this via a base KERNEL_FEATURES specification in the
relevant recipe(s), and
distros, or other configurations can override/extend it as required.

Cheers,

Buce


> Thanks,
> Ray
>
>
> On 01/07/2013 05:08 AM, Mihai Prica wrote:
>
>> Signed-off-by: Mihai Prica <mihai.prica@intel.com>
>> ---
>>   recipes-kernel/linux/linux-**yocto/kvm-enable.scc |    4 ++++
>>   recipes-kernel/linux/linux-**yocto/kvm.cfg        |    4 ++++
>>   recipes-kernel/linux/linux-**yocto_3.4.bbappend   |    1 +
>>   3 files changed, 9 insertions(+)
>>   create mode 100644 recipes-kernel/linux/linux-**yocto/kvm-enable.scc
>>   create mode 100644 recipes-kernel/linux/linux-**yocto/kvm.cfg
>>
>> diff --git a/recipes-kernel/linux/linux-**yocto/kvm-enable.scc
>> b/recipes-kernel/linux/linux-**yocto/kvm-enable.scc
>> new file mode 100644
>> index 0000000..0b5f4fc
>> --- /dev/null
>> +++ b/recipes-kernel/linux/linux-**yocto/kvm-enable.scc
>> @@ -0,0 +1,4 @@
>> +define KFEATURE_DESCRIPTION "Enable KVM host support"
>> +define KFEATURE_COMPATIBILITY board
>> +
>> +kconf non-hardware kvm.cfg
>> diff --git a/recipes-kernel/linux/linux-**yocto/kvm.cfg
>> b/recipes-kernel/linux/linux-**yocto/kvm.cfg
>> new file mode 100644
>> index 0000000..0cfcf58
>> --- /dev/null
>> +++ b/recipes-kernel/linux/linux-**yocto/kvm.cfg
>> @@ -0,0 +1,4 @@
>> +CONFIG_KVM=y
>> +CONFIG_KVM_INTEL=y
>> +CONFIG_KVM_AMD=y
>> +CONFIG_TUN=y
>> diff --git a/recipes-kernel/linux/linux-**yocto_3.4.bbappend
>> b/recipes-kernel/linux/linux-**yocto_3.4.bbappend
>> index 5b163ff..71bead2 100644
>> --- a/recipes-kernel/linux/linux-**yocto_3.4.bbappend
>> +++ b/recipes-kernel/linux/linux-**yocto_3.4.bbappend
>> @@ -4,5 +4,6 @@ SRC_URI += "file://xt-checksum.scc \
>>               file://ebtables.scc \
>>             file://vswitch.scc \
>>             file://lxc.scc \
>> +            file://kvm-enable.scc \
>>             "
>>
>>
>
> ______________________________**_________________
> meta-virtualization mailing list
> meta-virtualization@**yoctoproject.org<meta-virtualization@yoctoproject.org>
> https://lists.yoctoproject.**org/listinfo/meta-**virtualization<https://lists.yoctoproject.org/listinfo/meta-virtualization>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--047d7b1630894a93df04d2b6bfd1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Mon, Jan 7, 2013 at 12:26 PM, Raymond Danks <span dir=3D"ltr">&l=
t;<a href=3D"mailto:ray.danks@se-eng.com" target=3D"_blank">ray.danks@se-en=
g.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">I&#39;m going to show my lack of knowledge i=
n this area, but I know this is going to come up when I push a xen.cfg that=
 I apparently never added.<br>


<br>
Is it possible to do something along the lines of PACKAGE_CONFIG in the lin=
ux-yocto.bbappend? =A0For example, in the libvirt package one can use PACKA=
GE_CONFIG to construct a &quot;minimal&quot; build of libvirt. =A0What woul=
d be the method for one to do the same in this package?<br>

</blockquote><div><br></div><div>kernel configuration fragment use are cont=
rolled via the KERNEL_FEATURES variable, and</div><div>for anything pre-yoc=
to 1.4 that means an in-tree kernel configuration fragment (I&#39;m still p=
ushing</div>
<div>for the fragments to be maintained in tree, since that allows them to =
be reused and maintained</div><div>more easily).</div><div><br></div><div s=
tyle>KERNEL_FEATURES is managed like any other variable in the system, incl=
uding updating</div>
<div style>it via optional/dynamic features as we see fit.</div><div><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">

<br>
Yes, I imagine that worst case there can be a SRC_URI_distro definition tha=
t includes only the .scc files required for that &quot;minimal&quot; image =
build, but it seems like we want to keep away from that as much as possible=
 being that this isn&#39;t a distro layer.<br>


<br></blockquote><div><br></div><div style>Typically we do this via a base =
KERNEL_FEATURES specification in the relevant recipe(s), and</div><div styl=
e>distros, or other configurations can override/extend it as required.</div=
>
<div style><br></div><div style>Cheers,</div><div style><br></div><div styl=
e>Buce</div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Thanks,<br>
Ray<div><div><br>
<br>
On 01/07/2013 05:08 AM, Mihai Prica wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Signed-off-by: Mihai Prica &lt;<a href=3D"mailto:mihai.prica@intel.com" tar=
get=3D"_blank">mihai.prica@intel.com</a>&gt;<br>
---<br>
=A0 recipes-kernel/linux/linux-<u></u>yocto/kvm-enable.scc | =A0 =A04 ++++<=
br>
=A0 recipes-kernel/linux/linux-<u></u>yocto/kvm.cfg =A0 =A0 =A0 =A0| =A0 =
=A04 ++++<br>
=A0 recipes-kernel/linux/linux-<u></u>yocto_3.4.bbappend =A0 | =A0 =A01 +<b=
r>
=A0 3 files changed, 9 insertions(+)<br>
=A0 create mode 100644 recipes-kernel/linux/linux-<u></u>yocto/kvm-enable.s=
cc<br>
=A0 create mode 100644 recipes-kernel/linux/linux-<u></u>yocto/kvm.cfg<br>
<br>
diff --git a/recipes-kernel/linux/linux-<u></u>yocto/kvm-enable.scc b/recip=
es-kernel/linux/linux-<u></u>yocto/kvm-enable.scc<br>
new file mode 100644<br>
index 0000000..0b5f4fc<br>
--- /dev/null<br>
+++ b/recipes-kernel/linux/linux-<u></u>yocto/kvm-enable.scc<br>
@@ -0,0 +1,4 @@<br>
+define KFEATURE_DESCRIPTION &quot;Enable KVM host support&quot;<br>
+define KFEATURE_COMPATIBILITY board<br>
+<br>
+kconf non-hardware kvm.cfg<br>
diff --git a/recipes-kernel/linux/linux-<u></u>yocto/kvm.cfg b/recipes-kern=
el/linux/linux-<u></u>yocto/kvm.cfg<br>
new file mode 100644<br>
index 0000000..0cfcf58<br>
--- /dev/null<br>
+++ b/recipes-kernel/linux/linux-<u></u>yocto/kvm.cfg<br>
@@ -0,0 +1,4 @@<br>
+CONFIG_KVM=3Dy<br>
+CONFIG_KVM_INTEL=3Dy<br>
+CONFIG_KVM_AMD=3Dy<br>
+CONFIG_TUN=3Dy<br>
diff --git a/recipes-kernel/linux/linux-<u></u>yocto_3.4.bbappend b/recipes=
-kernel/linux/linux-<u></u>yocto_3.4.bbappend<br>
index 5b163ff..71bead2 100644<br>
--- a/recipes-kernel/linux/linux-<u></u>yocto_3.4.bbappend<br>
+++ b/recipes-kernel/linux/linux-<u></u>yocto_3.4.bbappend<br>
@@ -4,5 +4,6 @@ SRC_URI +=3D &quot;file://xt-checksum.scc \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 file://ebtables.scc \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://vswitch.scc \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://lxc.scc \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0file://kvm-enable.scc \<br>
=A0 =A0 =A0 =A0 =A0 =A0 &quot;<br>
=A0 <br>
</blockquote>
<br></div></div><div><div>
______________________________<u></u>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@<u></u>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.<u></u>org/listinfo/meta-<u></u>v=
irtualization</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end&quot;
</div></div>

--047d7b1630894a93df04d2b6bfd1--
