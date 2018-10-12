Return-Path: <Mingli.Yu@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7E612E00B6C; Fri, 12 Oct 2018 00:11:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 75283E00AC8
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Oct 2018 00:11:48 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9C7Blwm016526
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 12 Oct 2018 00:11:47 -0700 (PDT)
Received: from [128.224.162.173] (128.224.162.173) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Fri, 12 Oct 2018 00:11:46 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1539229819-322989-1-git-send-email-mingli.yu@windriver.com>
	<CADkTA4MrEE+TgU9Mb=jFXKk6sPkS=8-UYTm3XnWSde36rZG80w@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5BC0481E.2010603@windriver.com>
Date: Fri, 12 Oct 2018 15:07:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4MrEE+TgU9Mb=jFXKk6sPkS=8-UYTm3XnWSde36rZG80w@mail.gmail.com>
X-Originating-IP: [128.224.162.173]
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-openstack][PATCH 1/3] sanity-meta-openstack.bbclass: add class for bbappend files checking
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
X-List-Received-Date: Fri, 12 Oct 2018 07:11:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2018年10月12日 02:47, Bruce Ashfield wrote:
> merged.
>
> Note: this doesn't apply to my meta-openstack layer. So it was based
> on some version that I don't have. But since the change was simple
> enough, I resolved the issue and did the merge.

Thanks Bruce!

>
> Bruce
> On Wed, Oct 10, 2018 at 11:50 PM <mingli.yu@windriver.com> wrote:
>>
>> From: Mingli Yu <Mingli.Yu@windriver.com>
>>
>> Add a new class sanity-meta-openstack.bbclass,
>> to check whether necessary settings are available
>> for bbappend files and preferred version setting
>> in this layer to be effective and warn users if not.
>>
>> In addition, a variable SKIP_SANITY_META_OPENSTACK_CHECK
>> is added to enable users to explicitly skip the
>> checking to avoid unwanted warnings.
>>
>> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
>> ---
>>   meta-openstack/README                                | 19 +++++++++++++++++++
>>   meta-openstack/classes/sanity-meta-openstack.bbclass | 10 ++++++++++
>>   meta-openstack/conf/layer.conf                       |  4 ++++
>>   3 files changed, 33 insertions(+)
>>   create mode 100644 meta-openstack/classes/sanity-meta-openstack.bbclass
>>
>> diff --git a/meta-openstack/README b/meta-openstack/README
>> index 81b843b..8506250 100644
>> --- a/meta-openstack/README
>> +++ b/meta-openstack/README
>> @@ -5,6 +5,25 @@ This layer provides support for building the packages from the OpenStack project
>>   The layer contains recipes for the nova, glance, keystone, cinder, quantum, swift
>>   and horizon components.
>>
>> +The bbappend files for some recipes (e.g. postgresql) and preferred version setting
>> +(e.g. python-networkx)in this layer need to have 'openstack' in DISTRO_FEATURES to
>> +have effect. To enable them, add in configuration file the following line.
>> +
>> +  DISTRO_FEATURES_append = " openstack"
>> +
>> +If meta-openstack is included, but openstack is not enabled as a
>> +distro feature a warning is printed at parse time:
>> +
>> +    You have included the meta-openstack layer, but
>> +    'openstack' has not been enabled in your DISTRO_FEATURES. Some bbappend files
>> +    and preferred version setting may not take effect. See the meta-openstack README
>> +    for details on enabling openstack support.
>> +
>> +If you know what you are doing, this warning can be disabled by setting the following
>> +variable in your configuration:
>> +
>> +  SKIP_META_OPENSTACK_SANITY_CHECK = 1
>> +
>>   Dependencies
>>   ------------
>>
>> diff --git a/meta-openstack/classes/sanity-meta-openstack.bbclass b/meta-openstack/classes/sanity-meta-openstack.bbclass
>> new file mode 100644
>> index 0000000..3d5e57b
>> --- /dev/null
>> +++ b/meta-openstack/classes/sanity-meta-openstack.bbclass
>> @@ -0,0 +1,10 @@
>> +addhandler openstack_bbappend_distrocheck
>> +openstack_bbappend_distrocheck[eventmask] = "bb.event.SanityCheck"
>> +python openstack_bbappend_distrocheck() {
>> +    skip_check = e.data.getVar('SKIP_META_OPENSTACK_SANITY_CHECK') == "1"
>> +    if 'openstack' not in e.data.getVar('DISTRO_FEATURES').split() and not skip_check:
>> +        bb.warn("You have included the meta-openstack layer, but \
>> +'openstack' has not been enabled in your DISTRO_FEATURES. Some bbappend files \
>> +and preferred version setting may not take effect. See the meta-openstack README \
>> +for details on enabling openstack support.")
>> +}
>> diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
>> index 126f37f..f322bcd 100644
>> --- a/meta-openstack/conf/layer.conf
>> +++ b/meta-openstack/conf/layer.conf
>> @@ -35,5 +35,9 @@ PREFERRED_VERSION_python-jsonschema = "2.6.0"
>>   PREFERRED_VERSION_python-networkx = "1.11"
>>   PREFERRED_VERSION_python-oslo.i18n = "3.17.0+gitAUTOINC+f2729cd36f"
>>
>> +# Sanity check for meta-openstack layer.
>> +# Setting SKIP_META_OPENSTACK_SANITY_CHECK to "1" would skip the bbappend files check.
>> +INHERIT += "sanity-meta-openstack"
>> +
>>   LICENSE_PATH += "${LAYERDIR}/licenses"
>>   LAYERRECOMMENDS_openstack-layer = "meta-openstack-dl (= 2.6)"
>> --
>> 2.7.4
>>
>
>

