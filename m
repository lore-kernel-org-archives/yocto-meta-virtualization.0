Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4BAE5E00A9A; Wed,  5 Sep 2018 18:48:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E4FD0E00A85
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Sep 2018 18:48:50 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w861mnhr008247
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Sep 2018 18:48:49 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Wed, 5 Sep 2018 18:48:48 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1536029271-11750-1-git-send-email-Qi.Chen@windriver.com>
	<1536029271-11750-6-git-send-email-Qi.Chen@windriver.com>
	<CADkTA4O3Z3YjBGGb4hNUPBLAv2+hy8_T6ckfq13Er2OcZnTL6Q@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <e658453d-5f75-45be-7f65-66f70df19855@windriver.com>
Date: Thu, 6 Sep 2018 09:53:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4O3Z3YjBGGb4hNUPBLAv2+hy8_T6ckfq13Er2OcZnTL6Q@mail.gmail.com>
X-Originating-IP: [128.224.162.218]
Cc: meta-virtualization@yoctoproject.org, "Yang,
	Zhangle \(Eric\)" <Zhangle.Yang@windriver.com>
Subject: Re: [PATCH 6/6] layer.conf: depend on meta-webserver as nagios-core depends on apache2
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
X-List-Received-Date: Thu, 06 Sep 2018 01:48:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/06/2018 04:43 AM, Bruce Ashfield wrote:
> But nagios won't always be installed/used, so this is not a hard dependency of
> meta-virtualization.

If you don't think we should depend on webserver layer, ignore this patch.
I agree that it's not a hard dependency.

> So while I don't mind this going into the README as a depends, I don't think it
> belongs in the layer.conf.

Should we consider using LAYERRECOMMENDS? I'll send out V2 with this change.

> Also, can we have a README for how nagios works, and should be sanity tested ?
> As it stands right now, I have no way to know how to build and test it.

The runtime tests I did are:
1. systemctl status nagios-core
2. systemctl status nagios-nrpe
3. systemctl status nagios-nsca

These services started correctly without any error.

I agree that maybe more detailed usage examples and tests are better.
However, currently I don't have time for this.
People interested in nagios could find sufficient documents on nagios's 
official website.
Also, we don't have substantial patches that could possibly affect the 
service logic of nagios.

Best Regards,
Chen Qi


> I'll wait for a v2 with those changes.
>
> Bruce
>
> On Mon, Sep 3, 2018 at 10:47 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   conf/layer.conf | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/conf/layer.conf b/conf/layer.conf
>> index eaef1b7..ad2c96e 100644
>> --- a/conf/layer.conf
>> +++ b/conf/layer.conf
>> @@ -21,6 +21,7 @@ LAYERDEPENDS_virtualization-layer = " \
>>       networking-layer \
>>       filesystems-layer \
>>       meta-python \
>> +    webserver \
>>   "
>>
>>   # Override security flags
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


