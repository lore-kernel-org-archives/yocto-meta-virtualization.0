Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.5728.1626776234819059780
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 20 Jul 2021 03:17:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=UXFEz8qb;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=28359f4fe4=yanfei.xu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16KAFl4b018790
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 20 Jul 2021 03:17:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=to : from :
 subject : message-id : date : content-type : content-transfer-encoding :
 mime-version; s=PPS06212021;
 bh=3F1zT3VhevSUDWtf3czCX9h/aV2Ru3CKcA6ZLYL/fHk=;
 b=UXFEz8qbWEnJMyG9HPX2rKGujOq4XTOBpVjQHXUtyAhR+dJcIq7vqTSmbsPgx4hOWmyF
 jx8hJMdD0TmeWdD2U6W6N0UqIJrL7wIw0TITeglv8kN7GwNmHbMq76fyn2jofh/E+abc
 ++M66t+kJIwyG/cNGOubAXcpbinoGGFmQBfA3S/M6jRPyFEVT2UJaWvONXjI+SUdvM1u
 o7jnf1+OAVU7Ha1e+1AtDTs4V1I/E3YvUyZvD1GYHBT0Un6UWc3jQTN57gdHFJ8orory
 nFMJ5KWS25dFxm7Ks3jcsWFuJFD9hoXavwtCiXL6hsUwEiEpVN/O2nlNadjTkvt30z1Z yw== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
	by mx0a-0064b401.pphosted.com with ESMTP id 39whgtgbqu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 20 Jul 2021 03:17:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYIfUK64g7tBJCeZvXhcpeTNtrKeWYBig6pNWZzID7752hRnYsYEWo9tIRBM0nEXcrcXrYMlX2MprhSMwrUmtBDoAX7XUCqp6slJBnHk1hNFQ0vYm8zzIk+EIBzngGzIyIj314wP/9UyWi2qVGhtFdGRPoJdznXA9WU4jvQSCh5C5E2yx6IRa/Jkzy3RRplAuAE7Px9hHTy64LtRKVcXe/98EbqM2inpbFJ6FDpToLnKm5sDM68SZdO+VGqFbGrAuKKP6+reibbXvuPkhr2IzZoK2hMbU6nNKmdvSmlU8YCJ2lF9UU0VVKOI7kyu6b9wLG3LOmtiL7s4f95sjLLLew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3F1zT3VhevSUDWtf3czCX9h/aV2Ru3CKcA6ZLYL/fHk=;
 b=c24JiHt5fMQTR3Y0DG1vTsXUVhocc28J2AfGVXOgSIrzDadRCziRYYqdpxDDFg49nQ0kIdj+2rYbhfPPNu0ZgQaBgA4GDR0ZfsXm0JzRXvSlKmt7WjRtnfn7J+pi+vcmOieIAHZ30DRxMZxyIYs62ysQihNA8JVLWDB3KPdJOW1xuDlgyBOQlqIJYoIseQ2u40CM4yrCr35n/qC9iUedjkc5pvNXYvhq5nXA0+eonPgKZCmet3XNyHRqNoJGdRm7oY/SvRXxkTWxkRJtVGZ2jWTRDA7DgOsOWLBLb2qCcCJaiGQImh2Lo25pWZ4J4Wxz8k+C9RDMyXvqVS6oH2yQjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM8PR11MB5734.namprd11.prod.outlook.com (2603:10b6:8:31::22) by
 DM5PR11MB1995.namprd11.prod.outlook.com (2603:10b6:3:10::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21; Tue, 20 Jul 2021 10:17:11 +0000
Received: from DM8PR11MB5734.namprd11.prod.outlook.com
 ([fe80::bce8:81f7:f5a1:af19]) by DM8PR11MB5734.namprd11.prod.outlook.com
 ([fe80::bce8:81f7:f5a1:af19%8]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 10:17:11 +0000
To: meta-virtualization@lists.yoctoproject.org
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
Subject: [Bug] qemux86-64 restart hangs
Message-ID: <9c545e2e-7608-48bd-82f2-bdfd59470d41@windriver.com>
Date: Tue, 20 Jul 2021 18:17:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
X-ClientProxiedBy: HKAPR03CA0011.apcprd03.prod.outlook.com
 (2603:1096:203:c8::16) To DM8PR11MB5734.namprd11.prod.outlook.com
 (2603:10b6:8:31::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.160] (60.247.85.82) by HKAPR03CA0011.apcprd03.prod.outlook.com (2603:1096:203:c8::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.16 via Frontend Transport; Tue, 20 Jul 2021 10:17:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7adbcd2d-c244-4cd8-8818-08d94b67896b
X-MS-TrafficTypeDiagnostic: DM5PR11MB1995:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB19958A2A9804A4381C57080FE4E29@DM5PR11MB1995.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qGTnpqJnhjrU06Dkb4PotMB23KkcqJtj8QorqtSuqpdP/K35Gzfohozn4b2fGcVd9IoEKMoaZVGMiDsJsHSKCOq1xdwaCLOSiTiOEXd/41x0wH0mfrQjhqitvUW7T7X5eAMjHsoUkdrkNJfKWGTo/Jyq/NvHUVHgieT38GU2aHbLMeHS7Pj/6CbJLrWl+sItlkQYiMY/GPpb2ACRKccXzeKPHB1YOoMkxVLQQkxvKEqT2SyxzyBvqFvy3AOteB+rnAB7ODJzqvtLFDpy/XKFuR097I0DWDtroPzBYhFWtkhjXSUpBNGer7LA188E2rQ6Oddaq/OfAGewc/I6N/8uuJQudbtkvkSLO+JTdoAnE//RlI7n+cg2T6dhLcJye1gjICRJmvsO4FxQBbEdggG3e7pmLNrtmuOnDXrPd+XrK+CLLZx9R3rtQ/oyNjGwM0ZrXwaRIpC7ryWjB7axnXjIm7WmYTiKzhAIEdN13yllZuEQrAIKw394TBiUEghgJsjtMS7DWMu+9jEbodDSmoJ+Fb9JRmFBqlF5LdA+SjzYAPY6JiN+Ybty+KQsEixm/oxlf/PpuA38vzF5OdB9/8kV9e+MFCuLCZRVo2COHbltGucOm/XY54x7NZ4mLbCcYeTEauYvI4UX7a94oD4Pmfl/B72LcxlmQ78xQueepcrzi9YbTkgsbThbQ61UpEeeEuntcQOF8XTcWHiixL4uegyG5DR/Dp4mhYR8Ln+D9QVrxlHUgoooIRcgsjVc790NmZE0fT1+CEOItmhHDT+qPfQOYk+x0Aa79cw/Du3obORzzx4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5734.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(136003)(376002)(39850400004)(186003)(36756003)(31696002)(66476007)(83380400001)(38350700002)(66556008)(38100700002)(86362001)(8936002)(2906002)(66946007)(478600001)(8676002)(956004)(6486002)(6916009)(4744005)(6706004)(31686004)(16576012)(52116002)(26005)(6666004)(5660300002)(2616005)(316002)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?azFIa3A2L3hUR002SVo1OTBnTjR0aEVHaVBTYm5aSXNjY2Z4VVFOSUNveEhh?=
 =?utf-8?B?c08wcVBBNzVVRjJ5NHF0bzZVemh0dDJlUVl5eUR4bE1CODFEdHRIVXE1T2hk?=
 =?utf-8?B?Qjh6b3JjUXFxVmFQeHAvVWdzQXo0MG1nWFhuVHhBdnh3Skk0OXZmT2VzTHB5?=
 =?utf-8?B?QnphS2wzbTVMbXQxL2pVVGFEYTBmcGtlUllWNDhheDd3N0h4RUpFZlVmTmFX?=
 =?utf-8?B?UE1wRHBIUDRUaE9QNFhNVmhYTSs0azF6TUxQTFMzdlI3dkt2UTVVcXRMQlpy?=
 =?utf-8?B?NVpoQ2plazZvbUxOdlRwRExaMjYyUG5JbWExTmMzaWhFLzFlZUlkaWNpNnlp?=
 =?utf-8?B?enVXcjNaYkpTVEI5WHNraHNQbmhXdDU5a2Z0eURXOWRNZzI2Y0ZPVDZoNUty?=
 =?utf-8?B?ZW5wT0V2Qzk1byt0U1ZNSkhibDdPdFNuUXVvc3lVczBKUnN3OENWZ3BMSXdo?=
 =?utf-8?B?RHd0bSt1MmlDTGdJNGMxckFnd0dCMHVueW54blYvaEFiTDVaTHRsRWI5cEFa?=
 =?utf-8?B?OXYzbndRUVhEakw3WUdPaGxRMkw3dEV2RStiV0c4RVVNOXBuSWkzUFRLSEVw?=
 =?utf-8?B?M3VkWmJvRVRFaXVYNEpkRk1vZkM0YjB3a3ZubWhMaTgvOEtNd05SNDVJQlg4?=
 =?utf-8?B?eTBVU3NNYytyV2dSWGgwdjhnYjhtRGlvbWozRWNtbElpbFFDeWl0QXVFZ0Ry?=
 =?utf-8?B?S2J2UnhlRzJRZlNObVBUM0NVRU9HeVhtbVE1OEhXMFZ6SDh6Q3FyWUpOaERv?=
 =?utf-8?B?Z2JyV3NPSjlXWEJSd0ZPSVYxN1FqcE5wRzhKd3dwc2pvOW1CNjB2WG9GUUJm?=
 =?utf-8?B?ODBUdDRsN2VER21hMlVYNi9zNFF1N3g2MERRNHhXQnpkaFNMeTByRklSTnJx?=
 =?utf-8?B?empzTDhuaW5Cayt2cW9Pei9JQnVwZ2JweHZlN1I4NU5xVzR2K28vZ25JaFV3?=
 =?utf-8?B?Q1RIZ2dmTllvYkNPN043b0daN1loM2ZITWpQYmwvdzZPT0pFc0hsQjRSUC9S?=
 =?utf-8?B?OGUyRmFpQzNTSE0zaXBKSmxHZWlCb2JBVGUzWFlVUXpPaFhXTWF4S21qTEZF?=
 =?utf-8?B?bzZCS0NBalpTTFQ5Y2Z0b0tsM1VWM2xEQ0h5bjdHSEJHR1lTRS9JOElwVlpt?=
 =?utf-8?B?Y1ZGQVlIWC90Q0lDWVp0WTNTQWJtRVFYcGxQWlIxT05aOGtnM2J2d0kyVlR0?=
 =?utf-8?B?dUFVODh3RjdQUFIvbm13MVdPK0dEQS9hRG9yWXVFbCtkcUFtRkF1M2JhNlY3?=
 =?utf-8?B?cmpmamNubC85S0U2ZVdBU2hudUFRMDJ3MjhZU1VMSFZHSUxIVEpiS004OG9Y?=
 =?utf-8?B?ZFcxc1pySzJmVzVnb3lFa1NmeUNpWUNCa0Uwb0xnS1Mzb0NjTGpKV3QwNHJl?=
 =?utf-8?B?M1VjZFY3TUx0NkJYelhLZ2xIUktldjJrUjN2WVdmWVRLRVN2OE1YcWttNG4x?=
 =?utf-8?B?elpGNHRrUEtyQmFhL0tSSGpmTUxFdFN3Skg1WEFOMlJqQTl1S3NJblppUG9Y?=
 =?utf-8?B?NDhncThUQlFZUXd6dUVaWjZIVDgreGlVV3VFVk04VVhWZXIxUHpCTHFBRThI?=
 =?utf-8?B?eG1mRTlYRFFtaWc1NHpJTHBTbTYrek9SUFFYV2lCNXJNQll6cHZoVW9RK2ly?=
 =?utf-8?B?dFZFSWtJUXR2VDVFL0NuQ1Bob1VsOFFDKyt0dS8vUjBabC92VU1PMVhiTlZE?=
 =?utf-8?B?Y3g3NE5rRXRwOE8rQ0x6VmlVMXkyWUVTSTN6TkNMTzRYWjdKRG1jM1ZlY3VG?=
 =?utf-8?Q?gK/W4V/6At9pdvRKkV+8fep1H1jfk6x1nCH05mK?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7adbcd2d-c244-4cd8-8818-08d94b67896b
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5734.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 10:17:11.0479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DE8yZYytR837D/8VRaFV+wdRZ5nPsiWpp91CR4R7a69LT2dBXegpzj+KgOOXfxWbVrl7cQQSQUUrhTChXMjyUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1995
X-Proofpoint-GUID: 8UWnZxk0_lMePVXk-BsaehA87U-Awght
X-Proofpoint-ORIG-GUID: 8UWnZxk0_lMePVXk-BsaehA87U-Awght
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-07-20_04,2021-07-19_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 mlxscore=0 clxscore=1011 suspectscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=594 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107200065
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi

I tried to fill this bug in yocto bugzila, but the website can't create 
new count now. So I report it here.

The result of this bug: qemu machine reboot hangs.

reproduce steps:
    1) create a basic qemux86-64 project
    2) boot it and login
    3) execute "reboot" command.

You will notice that the machine don't restart, and hang, log as blow:

-----
[  113.813363] systemd-shutdown[1]: All loop devices detached.
[  113.813844] systemd-shutdown[1]: Stopping MD devices.
[  113.816245] systemd-shutdown[1]: All MD devices stopped.
[  113.816687] systemd-shutdown[1]: Detaching DM devices.
[  113.819166] systemd-shutdown[1]: All DM devices detached.
[  113.819733] systemd-shutdown[1]: All filesystems, swaps, loop 
devices, MD devices and DM devices detached.
[  114.096437] systemd-shutdown[1]: Syncing filesystems and block devices.
[  114.102780] systemd-shutdown[1]: Rebooting.
[  114.122488] reboot: Restarting system
[  114.122937] reboot: machine restart


Regards,
Yanfei
