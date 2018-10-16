Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DBDA9E00A4F; Mon, 15 Oct 2018 18:40:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3AC0AE00A10
	for <meta-virtualization@yoctoproject.org>;
	Mon, 15 Oct 2018 18:40:02 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9G1e1vW017658
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 15 Oct 2018 18:40:01 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Mon, 15 Oct 2018 18:40:00 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1539587720-29268-1-git-send-email-Qi.Chen@windriver.com>
	<CADkTA4M=TqJjHG1uped9dOb9JtW545KEXuqH_prWoFCg4xyd0g@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <276adf19-e4d9-391c-4c96-b08aeee07f68@windriver.com>
Date: Tue, 16 Oct 2018 09:45:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4M=TqJjHG1uped9dOb9JtW545KEXuqH_prWoFCg4xyd0g@mail.gmail.com>
X-Originating-IP: [128.224.162.218]
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] libvirt: do not defer postinstall to first boot when not necessary
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
X-List-Received-Date: Tue, 16 Oct 2018 01:40:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/2018 08:49 PM, Bruce Ashfield wrote:
> On Mon, Oct 15, 2018 at 3:28 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>> The postinstall in libvirt has already got a check against $D to
>> tell whether it's running on target or not, we do not need to use
>> pkg_postinstall_ontarget. Otherwise, we get unnecessary postinstall
>> deferred to first boot, which is not what we want.
> This commit message isn't complete ...
>
> So when is the postinstall run for the target case ?
>
> Bruce

This postinstall is only valid for the target case. The 
`/etc/init.d/populate-volatile.sh update' is only useful for an 
on-target package upgrade.
But we should ensure this by checking $D instead of using 
'pkg_postinstall_ontarget', as the latter case will always defer it 
first boot, which is obviously not what we want.
In fact, the postinstall was originally written as 
'pkg_postinstall_${PN}', it was incorrectly changed to 
'pkg_postinstall_ontarget_${PN} by the following commit.

commit 1e67a44db7ec87617455b3228ee5237ceb037173
Author: He Zhe <zhe.he@windriver.com>
Date:   Tue Jul 24 05:50:01 2018 -0700

     libvirt: Remove unsupported configure options and fix warning

     xen and xen-inotify have been removed from upstream. We change
     PACKAGECONFIG accordingly.

     pkg_postinst has been deprecated, use pkg_postinst_ontarget instead.

     WARNING: do_rootfs: Intentionally failing postinstall scriptlets of
     ['libvirt'] to defer them to first boot is deprecated. Please place
     them into pkg_postinst_ontarget_${PN} ().

     Signed-off-by: He Zhe <zhe.he@windriver.com>
     Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

I think the failing postinstall is caused by some bbappend file instead 
of the one in meta-virtualization.

I'll send out V2 to add more information in the commit message.

Best Regards,
Chen Qi

>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   recipes-extended/libvirt/libvirt_4.7.0.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-extended/libvirt/libvirt_4.7.0.bb b/recipes-extended/libvirt/libvirt_4.7.0.bb
>> index 47275ae..ecccfee 100644
>> --- a/recipes-extended/libvirt/libvirt_4.7.0.bb
>> +++ b/recipes-extended/libvirt/libvirt_4.7.0.bb
>> @@ -311,7 +311,7 @@ do_install_ptest() {
>>          done
>>   }
>>
>> -pkg_postinst_ontarget_${PN}() {
>> +pkg_postinst_${PN}() {
>>           if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
>>                   /etc/init.d/populate-volatile.sh update
>>           fi
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>


