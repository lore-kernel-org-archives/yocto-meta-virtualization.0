Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 65178E00876; Tue, 30 Sep 2014 11:10:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.171 listed in list.dnswl.org]
Received: from mail-vc0-f171.google.com (mail-vc0-f171.google.com
	[209.85.220.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 26BB5E0034C
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Sep 2014 11:09:58 -0700 (PDT)
Received: by mail-vc0-f171.google.com with SMTP id hy10so3079771vcb.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Sep 2014 11:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ANa89P0RNnUY6qP4JuAkkgcGU5t1mHipcyWPkWT3/7o=;
	b=Sm5JKx00LBO68esO8S0MwtUru2Gj0HYQ3JZcTvCLgt4ckSjATkgh/OhLonffdCuRLI
	2uHFEH5UAiWuqLF1h8hGSSJRD9QsPz3aIIzCQ2wE8n73Is246fwzuhsMt3sOlE3n2/Xz
	lSJeD4In980gyM9CEy5l2ZtRBJ7A3gOK3M3eeY2I+vyT2YzbZtWhjknq0pmA1GNznwXl
	Gf5Dh9kA32+XaWQJYRehpft6ftYxK5N8yT3dNoGChwGSK9A0dAG+UPBL27Qf4MjL1WM+
	EIQXoVlONjwbD/yQpX0ZJT9dxyahmBuMzU/zo2YeDHf/I2IRWsdKteWeKUcRE1q3TGHF
	PYKA==
MIME-Version: 1.0
X-Received: by 10.52.107.101 with SMTP id hb5mr31712953vdb.31.1412100597629;
	Tue, 30 Sep 2014 11:09:57 -0700 (PDT)
Received: by 10.52.75.135 with HTTP; Tue, 30 Sep 2014 11:09:57 -0700 (PDT)
In-Reply-To: <20140930130900.GA1825@iapetus.enea.se>
References: <1412082233-16687-1-git-send-email-josep.puigdemont@enea.com>
	<20140930130900.GA1825@iapetus.enea.se>
Date: Tue, 30 Sep 2014 14:09:57 -0400
Message-ID: <CADkTA4MSdXU_n3JEC+BTG36HuBjeX6saF2pu-ajhi7WTX6-q8Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc: build API docs only when required
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
X-List-Received-Date: Tue, 30 Sep 2014 18:10:06 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 30, 2014 at 9:09 AM, Josep Puigdemont
<josep.puigdemont@enea.com> wrote:
> On Tue, Sep 30, 2014 at 03:03:53PM +0200, Josep Puigdemont wrote:
>> Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
>> ---
>>  recipes-kernel/linux/linux-yocto_3.4.bbappend | 16 ----------------
>>  1 file changed, 16 deletions(-)
>>  delete mode 100644 recipes-kernel/linux/linux-yocto_3.4.bbappend
>>
>> diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend b/recipes-kernel/linux/linux-yocto_3.4.bbappend
>> deleted file mode 100644
>> index 0b2ff53..0000000
>> --- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
>> +++ /dev/null
>> @@ -1,16 +0,0 @@
>> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>> -
>> -SRC_URI += "file://xt-checksum.scc \
>> -            file://ebtables.scc \
>> -         file://vswitch.scc \
>> -         file://lxc.scc \
>> -         "
>> -KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
>> -
>> -KERNEL_MODULE_AUTOLOAD += "openvswitch"
>> -KERNEL_MODULE_AUTOLOAD += "kvm"
>> -KERNEL_MODULE_AUTOLOAD += "kvm-amd"
>> -KERNEL_MODULE_AUTOLOAD += "kvm-intel"
>> -
>> -# xen kernel support
>> -SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
>
> eeh, sorry, I sent the wrong patch with the wrong commig message!
>
> Still linux-yocto_3.4.bbappend should probably be removed since that kernel
> is not suppoted in yocto on master, and a new bbappend for 3.17 should be added
> too (same as for 3.14 seems to work on my machine).

I have the kernel bbappend changes made locally, since I'm just about to push a
3.17 series to oe-core .. I'll update meta-virt at the same time.

Bruce

>
> Sorry for the confusion.
>
> best regards,
> /Josep
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

