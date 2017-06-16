Return-Path: <adrian.ratiu@ni.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 95D6FE00B58; Fri, 16 Jun 2017 06:07:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,KHOP_DYNAMIC,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [148.163.156.75 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.3 KHOP_DYNAMIC Relay looks like a dynamic address
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7BADFE00A9B
	for <meta-virtualization@yoctoproject.org>;
	Fri, 16 Jun 2017 06:07:03 -0700 (PDT)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
	v5GD6STk005450; Fri, 16 Jun 2017 08:07:02 -0500
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2b4fvw00e7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 16 Jun 2017 08:07:02 -0500
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod2.natinst.com (8.16.0.17/8.16.0.17) with ESMTPS id
	v5GD71E9032213
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2017 08:07:01 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Fri, 16 Jun 2017 08:07:01 -0500
Received: from adi-pc-linux (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Fri, 16 Jun 2017 08:07:00 -0500
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	<meta-virtualization@yoctoproject.org>
In-Reply-To: <8a2678cb-7306-9463-864e-93763a86dea7@windriver.com>
References: <20170616121047.30717-1-adrian.ratiu@ni.com>
	<8a2678cb-7306-9463-864e-93763a86dea7@windriver.com>
Date: Fri, 16 Jun 2017 16:06:40 +0300
Message-ID: <87tw3gw07z.fsf@adirat.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-06-16_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=7 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1703280000 definitions=main-1706160217
Subject: Re: [meta-openstack][PATCH] layer.conf: bump python-requests 2.12 -> 2.13
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
X-List-Received-Date: Fri, 16 Jun 2017 13:07:06 -0000
Content-Type: text/plain

On Fri, 16 Jun 2017, Bruce Ashfield <bruce.ashfield@windriver.com> wrote:
> On 2017-06-16 8:10 AM, Ioan-Adrian Ratiu wrote:
>> Meta-oe upreved to 2.13 (present in Pyro) so bump it here also to
>> avoid bitbake messages like:
>> 
>> "NOTE: preferred version 2.12.0 of python-requests not available"
>
> Unless we've tested it, I'd like to keep it with the warning. We
> are (slowly) working towards an update of all the core components.
>
> This version was selected/preferred, because it actually works.
>
> And the warning will force us to test and confirm if it is safe to
> move on.
>
> Has this been tested ?

No.

>
> Or is the warning popping up in another scenario ? i.e. you are
> using some packages from meta-openstack that trigger the warning,
> but don't hit the runtime issue ? In that case, I could take the
> patch, since we do want the package reuse from the layer and
> forcing people to live with that warning will restrict the reuse.

Yes, this is the scenario.

The warning is annoying because the branches are inconsistent: pyro
from meta-cloud-services/meta-openstack wants software which does
not exist anymore in meta-oe's pyro..

>
> Bruce
>
>> 
>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>> ---
>>   meta-openstack/conf/layer.conf | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
>> index 98282e2..61e9fb5 100644
>> --- a/meta-openstack/conf/layer.conf
>> +++ b/meta-openstack/conf/layer.conf
>> @@ -18,7 +18,7 @@ PREFERRED_VERSION_python-futures = "3.0.3%"
>>   PREFERRED_VERSION_python-django = "1.8.6"
>>   PREFERRED_VERSION_python-netaddr = "0.7.19"
>>   PREFERRED_VERSION_python-sqlalchemy = "1.0.16"
>> -PREFERRED_VERSION_python-requests = "2.12.0"
>> +PREFERRED_VERSION_python-requests = "2.13.0"
>>   PREFERRED_VERSION_python-amqp = "1.4.9"
>>   PREFERRED_VERSION_python-kombu = "3.0.%"
>>   
>> 

