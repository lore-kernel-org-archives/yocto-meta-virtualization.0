Return-Path: <yanglei.fage@gmail.com>
Received: from mail-bk0-f45.google.com (mail-bk0-f45.google.com
	[209.85.214.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EE3F3E002AB
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Jan 2013 22:08:58 -0800 (PST)
Received: by mail-bk0-f45.google.com with SMTP id jk13so1245555bkc.4
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Jan 2013 22:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=MYgNiOx/Ywa1AD2HhRfQ6dEnpr8J5rWBICWosFfvLfg=;
	b=NkPfFZfg8EFkT56WgQnpp+LGWPD/tQ6abvaLPfzYlhdmwItJqi6B/FQ8B8TjQOIAU2
	zU8TleCrGp0qodmktFD+mraTAneS1bClQ5de7h49iCAccNHn8V32bmcl21UczBVWmxxr
	MeuqllFfYrl/0azZU0HkmjiLEsKcpK+p53Et3SYzNOt7+Y9g3/EdnFuNh7narGdcsi6n
	CBysS07I86pMZfWx79ef67ZQCqqTkfJ/kR9nHBHCokAb5PzonydcUh1/JVEUIaYyFbZR
	QDRpR6i1VszUSQZ2I8b1St+X+lf1Zk2qe+v1oErPACEJN8SYEMTuCDUbjGsRwQbVP7lo
	W+Hg==
MIME-Version: 1.0
Received: by 10.204.5.205 with SMTP id 13mr38214317bkw.111.1357970937223; Fri,
	11 Jan 2013 22:08:57 -0800 (PST)
Received: by 10.204.11.86 with HTTP; Fri, 11 Jan 2013 22:08:57 -0800 (PST)
In-Reply-To: <CADkTA4Nh1b6oySSoz59oODeLyehSYdGsUrh3JMLK2C9=AOZaKg@mail.gmail.com>
References: <1357921647-17864-1-git-send-email-mihai.prica@intel.com>
	<CADkTA4Nh1b6oySSoz59oODeLyehSYdGsUrh3JMLK2C9=AOZaKg@mail.gmail.com>
Date: Fri, 11 Jan 2013 22:08:57 -0800
Message-ID: <CAHsH0E8431dvHzC+qHerH6UqpDp3KbUzOf8vE5KXHUw0+23_QQ@mail.gmail.com>
From: lei yang <yanglei.fage@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2 1/2] linux-yocto: added kernel configuration for KVM
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
X-List-Received-Date: Sat, 12 Jan 2013 06:08:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jan 11, 2013 at 1:08 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Fri, Jan 11, 2013 at 11:27 AM, Mihai Prica <mihai.prica@intel.com> wrote:
>>
>> Signed-off-by: Mihai Prica <mihai.prica@intel.com>
>> ---
>>  recipes-kernel/linux/linux-yocto_3.4.bbappend |    5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend
>> b/recipes-kernel/linux/linux-yocto_3.4.bbappend
>> index 5b163ff..6fa02e8 100644
>> --- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
>> +++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend
>> @@ -6,3 +6,8 @@ SRC_URI += "file://xt-checksum.scc \
>>             file://lxc.scc \
>>             "
>>
>> +KERNEL_FEATURES_append = " kvm/qemu-kvm-enable"
>
>
> Have you confirmed that this is adding the option you want ? I would have
> expected this to be:
>
> KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
>
>

Hi Bruce,

I also notice this, I did a serch in internal layer just found below
in wr-kernel use the same way

templates/feature/libhugetlbfs/template.conf:KERNEL_FEATURES_append +=
"features/hugetlb"

I don't know if there is defect for this, both work or not,or we like
.scc is there(coding style)

I'm glad to do a test later.

Lei


>>
>> +
>> +module_autoload_kvm = "kvm"
>> +module_autoload_kvm-amd = "kvm-amd"
>> +module_autoload_kvm-intel = "kvm-intel"
>
>
> This part looks fine though.
>
> Cheers,
>
> Bruce
>
>>
>> --
>> 1.7.9.5
>>
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at
> its end"
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

