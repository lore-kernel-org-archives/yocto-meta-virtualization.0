Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.160.1627502211897770098
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 28 Jul 2021 12:56:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=HsNU6kUX;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=384319cfa6=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16SJkA5b019265;
	Wed, 28 Jul 2021 19:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=jPj17RyZlTcN+JMN30j2NQ+pNvTJHwz4rImUyhVSEHk=;
 b=HsNU6kUXOEXML5MH3hXtrdXrnFnveuvsI6ekaPcizK8r5yhbBDk82sU2ZQdaknW/PVN5
 1Fc7W2+kpXeJsxZVk0z+xaoVStOd/4o5XLhJc7VW//wlpLhCUqD3TWx74uyQbcCmCG26
 06lklNHpFIHFGRSut8CqCoULXxGZ1GnSj6Qi36JsH4x9zZWT0NfIO0uNCSGHE1IAUL+w
 cbyNbXOTq1cBHUxOObmYfcrfbDtHJ2hYhGCjREG59e7v9Og2yCocCZ2pOFxvbjCcy3kb
 5HOyTY/IVK5IEo2bizjS3B6990lHB9D8/vd7EsBXEs2px8/pZVilXWPiBnbGWJRsxraD YQ== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a34gygnde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Jul 2021 19:56:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tivfn6oZ869vfXyOkIErdEpN7edg2OHgqtrMS78kw2UlAFIgfqmnHNYmtq0UDlUmZJqwn0Rxfz7rQcxaRWnMD7ED10BHXKczAwT6MByYSH3OeeJlq3tWFor7ST+ZlvRy9sVOTlauy1F4neY50APwlkqtiTJXFrfQT0YfrglKeRh0XYygTzEXOoS/cRGayxxCZaJY+PP68JMA/22ErWt38q9jsyZVPoVI+qxM5UeVZTezLyqjPmvHSHJkX2f8qMipBQiz4d8XXaGmc30Tfbk7pdMQH7eish6MWy5H1YOJZ3WLQNFrgb/bOIQQDY1zW55SAPeFn4Bah41VOGbM4Rk91A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPj17RyZlTcN+JMN30j2NQ+pNvTJHwz4rImUyhVSEHk=;
 b=KrUDRspXJfqnxi6AIoj5hmOtdWwlSMBqDQXcRTSpkNoHPu/SeqPSUdSvjEyi6FP7G2pAtZ5NU0jLT4V3i/J7T1zwazMOVU2I4aA8LmH1S6DECGRvKpNPprme6JupbPhE0or8Gz33hCyJXUA9xey+bA+V6FgCYad8Q+3UFcwa03pfk6lABhJeK3La7fcjz3zx1RRZArHqncBaTbq3VUdHpXQ0kzydFH28nYt+9viePZ196Qt84WM46nJ+cTrgBfZUC4r1QtK3uMFbzxO5qDKeVc2hP7PBV4YL22gLUQhxUUdLQ4u5/095E8LRg+UVkGvJNgsRiYKvz4frnwQ0wkAc3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM4PR11MB5279.namprd11.prod.outlook.com (2603:10b6:5:38a::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.26; Wed, 28 Jul 2021 19:56:47 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::d44b:60e8:b607:73f7]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::d44b:60e8:b607:73f7%7]) with mapi id 15.20.4352.031; Wed, 28 Jul 2021
 19:56:47 +0000
Subject: Re: uprev k8s from v1.20.4 to v1.20.9
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <ea3f1ccf-b659-631f-460f-bc69be735728@windriver.com>
 <CADkTA4O4TFL0oyKsDZWSKE7R5DhDjU71tj7ktxVdsdZHTDR9TA@mail.gmail.com>
From: sakib.sajal@windriver.com
Message-ID: <e6176835-a0e3-aee5-4fca-da38c8201a1f@windriver.com>
Date: Wed, 28 Jul 2021 15:56:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CADkTA4O4TFL0oyKsDZWSKE7R5DhDjU71tj7ktxVdsdZHTDR9TA@mail.gmail.com>
X-ClientProxiedBy: YT1PR01CA0047.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::16) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.28] (184.147.146.64) by YT1PR01CA0047.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17 via Frontend Transport; Wed, 28 Jul 2021 19:56:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b51e7b2-2e53-4b93-b42a-08d95201d516
X-MS-TrafficTypeDiagnostic: DM4PR11MB5279:
X-Microsoft-Antispam-PRVS: 
	<DM4PR11MB5279F3F9811EBD05CE9A0A47F2EA9@DM4PR11MB5279.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aLeyvJ8FjX3QEUPZ4XiL96JuUlux+2qDxmglItOWYI/upjqsMp9AsaYOko6A24oLs8JfShrKiANujss8UV2NQEqFOns7VjCwZ4t3I3B+0LDjBBeZXhu887H3jb6QNlcLn/DzEKuTJH8Pvysj0sqQiomCxlaQzziqhwG2T7JMLxeLFXkFkzqMVZ9JEJkWUl/8C8NuWfOxXV3qAv/VB8tqIAYU4AB+AwspgYy4HGOtA/TGuEiDs8QHX5GenXd+1oekc2X9Uuhd2DXjhHo1TH2M4GPKC7AZBA7wNZeZbsaJ/S+P0j58D2wQnkw+UNblfSPMKbJs9KNE93GC4DFUcYxaZHshxMZYt4Rv658uDYUEAuVbG8m5V7LfM9O9WeNapBU8x/fr04y+KXRaPuF7v52yew3vD6lBYLKjZgucmEw6i4rjGIVFVIVCwDRVVlmh6arWBiFuASRT4SvwkOVP4JZeeApgBDysMf+KjBeS+ZWH0DLa6V8FwbBjmnucR0HAGCN/OzShJPRgMolcO/pWYuSlSUCN2LJjotumwaa/JijC0Uuv3EHxdbUYrWlO3BrB8yqF/DMu3sCORZqzNeb2RHvT7qapoWEO6EIwMq6ouHPZD88puy2btQ2n5wh4t/IS2MrUiYPq3CQVbjzxHB+RrvRM0ZdUWhYg97X+XAQAQNtbJoHBEqmVhvpQilbRURfHZiZBGJ5t+/3eNKAsTqBqjNt5mxxxChUE5nAHnbhroWWgGR+wJ2Y/ECR+rRxJQZi3wyIxekkRMOLEyfRxtpOkjfwWcA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(396003)(39850400004)(346002)(4326008)(186003)(478600001)(5660300002)(33964004)(53546011)(86362001)(52116002)(26005)(83380400001)(36756003)(316002)(31696002)(2616005)(16576012)(956004)(66476007)(2906002)(6486002)(66946007)(8936002)(38350700002)(66556008)(38100700002)(8676002)(31686004)(6916009)(44832011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?czVxZ3NCQ2N3R1kzbG9vamtOVGJrRm1oWlpIR01HQUpNM1JYbUJkQWVnZ1I4?=
 =?utf-8?B?dzZrZExORUM2WnJUS0JkWWIxWUg3dk1ydGxWZ2pUODVlaTNPUXZCc2xzNDR6?=
 =?utf-8?B?cFloVWE0bUV2cnc3L2gwaEs4UkxsME5zQS9LRWZBUWxzNEtkWnk1Qlo1ajUv?=
 =?utf-8?B?dmYyb2k5aUlHdHI0bnFKNmR4S0swZUZ2TWlwZXMyTExSMHFPOTNmQjNLQnhu?=
 =?utf-8?B?STNLWmx5amdyeG5EZ2JydVRBZmtEOW9pVnFNeTJBZ05sZEQ4UzJweHRhU0JZ?=
 =?utf-8?B?SXZ4akNXVnhPWFQ5MVB1MkdoVnNTQW5XeDN1ZzlPT3poWTYwZEdvQ3E3U2JO?=
 =?utf-8?B?Z1pMNVdtYlNDc21DVXQ4RldqYVNWayticUs4Z2dQZzBzNUkxcTNSV3lFUFhS?=
 =?utf-8?B?ZnlyWlhKeHdqcjcxb1hRR1g0L3pLTHBpWXRsTnNsQW9oZStGM1daUVhPN2lr?=
 =?utf-8?B?OW5LZ1FqeldTTGJUVkpTUHVLNTVHdC9CbHNremwwOGE1ZzBobCttKzEwdGgr?=
 =?utf-8?B?RUpHd1YxSGhZMHhqL09FK1IwTVVKaWhUMXJKdnNGbzJTOFgzMkRSR2U4Szc4?=
 =?utf-8?B?c1NFVjQwTU5HS0ZDcXBVOVJSNmF3Yng3MmRJRVQ3Rkx6TVpIZlZHWkY0Qy9F?=
 =?utf-8?B?MVJDbUw4NXA2NzA3b05lcWl1WXVrT0FFKzVLR2xENlBvOXFQZDRzSnJ1ZUVU?=
 =?utf-8?B?NG1ENlhBb2s4U3NSeGcyUEFnbDdjcEVhSkRnUStWNmtyNGxPNGtYS3VDRVc3?=
 =?utf-8?B?VFNFYUY2UUhIV2FGOExiV0gxSG05bjFkaEk0aGlYU01keU55UFp5alk4TG1E?=
 =?utf-8?B?NmtEdlBmVmxCM21yVWpUdzhTRm5wTEZRc2lHa041Z3k5Smx3WjZaVk5oOCta?=
 =?utf-8?B?TzZVdWVVeWtRUHh0NnNreWhESEpwbFNQWHlvMlZlVEY1Mm12dWhYd1l3YVBV?=
 =?utf-8?B?bEs5SWd3bnFmQmtVL2hISjJuZEd1RkR3dzVWb0JRekV6UXM5aHZmZmFOYjJL?=
 =?utf-8?B?ajNzN1p1RXNJMXlkaVFGTnFKTktiOHZyVUxjdWpnUTJzNklEUUs4eXRhQWNY?=
 =?utf-8?B?d3puY3ZTTDVyeFJYeDFaaW5pOXdDK21tQWRhK1RpZ0NUQy9Edi9XYW1LTDds?=
 =?utf-8?B?cmtCczBDWUFWM0kzMkUzQ095RFYwcUtKendZb0JFWnRtRStJZkw3eDl4M2lB?=
 =?utf-8?B?b1FVYWJESkRYZEVYNG9Cbi96UUxvbkNBWDNRbnVoNzFZa1J6NzVmWEVGSHcx?=
 =?utf-8?B?dkx2eEN5aWhBSmZIdDBuY0VDdVpkL3RLZ1VHZFBROTFxVUwyVFhjMXRuckVS?=
 =?utf-8?B?dXkzWitReVdGWFN4b2EzZ0l1QlpRYzVWWVY0SVg5bkRQb2tFdEc4cVRZSGVW?=
 =?utf-8?B?elJlWFR5cWN1L291QUp4WFVIM0ovV3FJKzdlVXR0Z2lrV2w2REFGb0N0SFpP?=
 =?utf-8?B?QjRuKzRxTElPeU1rajZMNUxwZWNESGQ4aTJNWStrVGN3cm4yNXFJZ2lpVllZ?=
 =?utf-8?B?Mml2T1VJdWMwUExlR0Nzbm9zQ2h3dlNFa3llYWZqSlVZKzdaWmJJVWdHZUVy?=
 =?utf-8?B?dWdNeURwVk5nNXBRM25hQWpxVjJjS09IMlVDcWtTY1VabFAzKzFnRVB4SElD?=
 =?utf-8?B?ZCtlNEE3Lzhxam9wNnZhWkZScTlRVHdmTnZkK2kzbWpLK2U1c3VHd2JiTyta?=
 =?utf-8?B?Z09ibFV0bG10b2wwcnlmRU1zdk9JQTF4cVRDSzIrQ1hMWUEySjAwT1FzOE5j?=
 =?utf-8?Q?Noi1evXmD5Csxl93TWXyr8huzUJvsVUUXWi3sis?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b51e7b2-2e53-4b93-b42a-08d95201d516
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 19:56:47.4155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GqUBvjmJkIWpP/pEv/nWHGsZ/IZUbdRe8huJEv+LZKKQ9KERJvNV/LCdCfPPiSUBLWrEAcz3dXG074Pr2JHpelULa4guqCXn5/+/4twhS5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5279
X-Proofpoint-GUID: 4LO_MzaaPnkB11I_h67DWLkFC2ALqpwG
X-Proofpoint-ORIG-GUID: 4LO_MzaaPnkB11I_h67DWLkFC2ALqpwG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-07-28_09,2021-07-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=893 priorityscore=1501
 phishscore=0 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107280113
Content-Type: multipart/alternative;
 boundary="------------7F7808BD04955AB2F03DFFB8"
Content-Language: en-US

--------------7F7808BD04955AB2F03DFFB8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-07-28 3:31 p.m., Bruce Ashfield wrote:
>
> **[Please note: This e-mail is from an EXTERNAL e-mail address]
>
>
>
> On Wed, Jul 28, 2021 at 2:37 PM Sakib Sajal <sakib.sajal@windriver.com 
> <mailto:sakib.sajal@windriver.com>> wrote:
>
>     Hi Bruce,
>
>     I was thinking of upgrading kubernetes on the hardknott branch from
>     v1.20.4 to 1.20.9. This change will bring fixes for CVE-2021-25735
>     and
>     CVE-2021-25737 as well as other fixes.
>
>     This will bring in 309 commits:
>
>     kubernetes.git$ git log --oneline v1.20.4...v1.20.9 | wc -l
>     309
>
>     I was wondering if you had already started the work or should I go
>     ahead
>     with the uprev to v1.20.9 or any other release.
>
>
> Go ahead. That's still in the same major version, so it is ok to 
> version bump.
>
> I've already moved master to 1.23 (but see that I messed up the 
> shortlog),
>
> Bruce
>
Thanks! I will try to not mess up myself.

Sakib

>
>
>     Sakib
>
>
>
> -- 
> - Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--------------7F7808BD04955AB2F03DFFB8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-07-28 3:31 p.m., Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CADkTA4O4TFL0oyKsDZWSKE7R5DhDjU71tj7ktxVdsdZHTDR9TA@mail.gmail.com">
      
      <div style="border:solid #9C6500 1.0pt;padding:2.0pt 2.0pt 2.0pt
        2.0pt">
        <p class="MsoNormal" style="line-height:12.0pt;background:#FFEB9C"><b><span style="font-size:10.0pt;color:#9C6500"></span></b><span style="font-size:10.0pt;color:red">[Please note: This e-mail
            is from an EXTERNAL e-mail address]<o:p></o:p></span></p>
      </div>
      <div>
        <div dir="ltr">
          <div dir="ltr">
            <div class="gmail_default" style="font-size:small"><br>
            </div>
          </div>
          <br>
          <div class="gmail_quote">
            <div dir="ltr" class="gmail_attr">On Wed, Jul 28, 2021 at
              2:37 PM Sakib Sajal &lt;<a href="mailto:sakib.sajal@windriver.com" moz-do-not-send="true">sakib.sajal@windriver.com</a>&gt;
              wrote:<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
              0.8ex;border-left:1px solid
              rgb(204,204,204);padding-left:1ex">
              Hi Bruce,<br>
              <br>
              I was thinking of upgrading kubernetes on the hardknott
              branch from <br>
              v1.20.4 to 1.20.9. This change will bring fixes for
              CVE-2021-25735 and <br>
              CVE-2021-25737 as well as other fixes.<br>
              <br>
              This will bring in 309 commits:<br>
              <br>
              kubernetes.git$ git log --oneline v1.20.4...v1.20.9 | wc
              -l<br>
              309<br>
              <br>
              I was wondering if you had already started the work or
              should I go ahead <br>
              with the uprev to v1.20.9 or any other release.<br>
            </blockquote>
            <div><br>
            </div>
            <div>
              <div class="gmail_default" style="font-size:small">Go
                ahead. That's still in the same major version, so it is
                ok to version bump.</div>
              <div class="gmail_default" style="font-size:small"><br>
              </div>
              <div class="gmail_default" style="font-size:small">I've
                already moved master to 1.23 (but see that I messed up
                the shortlog),&nbsp;</div>
              <div class="gmail_default" style="font-size:small"><br>
              </div>
              <div class="gmail_default" style="font-size:small">Bruce<br>
              </div>
              <br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>Thanks! I will try to not mess up myself.</p>
    <p>Sakib<br>
    </p>
    <blockquote type="cite" cite="mid:CADkTA4O4TFL0oyKsDZWSKE7R5DhDjU71tj7ktxVdsdZHTDR9TA@mail.gmail.com">
      <div>
        <div dir="ltr">
          <div class="gmail_quote">
            <div>
            </div>
            <div><br>
            </div>
            <div>&nbsp;</div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
              0.8ex;border-left:1px solid
              rgb(204,204,204);padding-left:1ex">
              <br>
              Sakib<br>
              <br>
            </blockquote>
          </div>
          <br clear="all">
          <div><br>
          </div>
          -- <br>
          <div dir="ltr" class="gmail_signature">- Thou shalt not follow
            the NULL pointer, for chaos and madness await thee at its
            end<br>
            - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
            <br>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------7F7808BD04955AB2F03DFFB8--
