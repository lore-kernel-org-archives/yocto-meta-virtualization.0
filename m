Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 067E6E01566
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Oct 2013 01:10:05 -0700 (PDT)
Received: from [172.16.140.23] (172.16.140.23) by smtp.enea.com (172.21.1.209)
	with Microsoft SMTP Server id 14.2.318.1;
	Fri, 11 Oct 2013 10:10:00 +0200
Message-ID: <5257B256.7070705@enea.com>
Date: Fri, 11 Oct 2013 10:09:58 +0200
From: =?UTF-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20131004163952.GA5669@longhaul.twobit.us>
	<524EF9AE.7090201@twobit.us> <52551E5A.4000204@gmail.com>
	<CADkTA4PvJVHCvLi7bG7Vckqv-8MqbWju3HwSvkc7eo8HE89Nzw@mail.gmail.com>
In-Reply-To: <CADkTA4PvJVHCvLi7bG7Vckqv-8MqbWju3HwSvkc7eo8HE89Nzw@mail.gmail.com>
X-Originating-IP: [172.16.140.23]
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] Explicitly set CHECKPOLICY path to native sysroot.
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
X-List-Received-Date: Fri, 11 Oct 2013 08:10:08 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On Fri 11 Oct 2013 05:21:37 AM CEST, Bruce Ashfield wrote:
> On Wed, Oct 9, 2013 at 5:14 AM, David Nystr=C3=B6m <david.c.nystrom@gmail=
.com> wrote:
>> On 10/04/2013 07:23 PM, Philip Tricca wrote:
>>>
>>> Probably should add that I'm not very fond of having the path hard code=
d
>>> like this. Makes for a dependency on the install location from the
>>> checkpolicy recipe. For the short term this fixes the immediate issue
>>> though. Feedback on the "right way" to reference / find this binary
>>> would be appreciated.
>>>
>>> Regards,
>>> - Philip
>>
>>
>> I suppose the correct way would be to patch the configure scripts and
>> upstream that patch to Xen. But I have no problems with this, as long as
>> chkconfig referenced from native sysroot is in DEPENDS, to avoid build r=
ace
>> conditions.
>
> Which isn't the case at the moment.So this patch needs a bit more work.

I guess its true what they say, "noone can hear you be subtle on the=20
internet" :)

> Philip: Are you talking about the selinux checkpolicy here ? I assume you=
 are,
> but want to be sure. If you are, not only do we need the package in the
> DEPENDS, we need meta-selinux in the README's layer dependency list for
> meta-virt.

If so , we should make this dependency optional if selinux is in=20
DISTRO_FEATURES.

>
> Bruce
>
>>
>> Br,
>> David
>>
>>
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>

