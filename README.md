#URL Route
UrlRoute let popVC,pushVC,presentVC actions easier and more dynamically.And also reduce relations between VC and VC.

###Feature

1.manage all view-jumping actions in a plist together,change routes more easier and also can change dynamically by server.
2.alow sending value to next VC and callback to the pop VC.
3.can set a view for any error actions for the view-jumping.
4.also support open app outside for a special view.


###Usage

1.the window rootView must be `UINavigationController`

```` objectivec
    ViewController *vc = [[ViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    self.window.rootViewController = nav;

````

2.all the viewController must be `CurrentViewController`'s childVC.

3.setup your personal url map in `SDCUrlRouteConfig.h`,`SDCUrlRouteFile.plist`

4.compelet all the steps above.You can play it.like this:

```` objectivec
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
        {
            [[SDCUrlRouteCenter sharedCenter]open:localRouteUrl(RouteToTestVC) animated:YES];
        }
            break;
        case 1:
        {
            [[SDCUrlRouteCenter sharedCenter]open:localRouteUrl(RouteToTestVC) animated:YES URLRedirectType:kUrlRedirectPresent];
        }
            break;
        case 2:
        {
            NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"hello Test1",@"key", nil];
            [[SDCUrlRouteCenter sharedCenter]open:localRouteUrl(RouteToTestVC) animated:YES extraParams:dict];
        }
            break;
        case 3:
        {
            NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"hello Test2",@"key", nil];
            [[SDCUrlRouteCenter sharedCenter]open:localRouteUrl(RouteToTestVC) animated:YES URLRedirectType:kUrlRedirectPresent extraParams:dict];
        }
            break;
        case 4:
        {
            [[SDCUrlRouteCenter sharedCenter]open:@"http://www.baidu.com" animated:YES];
        }
            break;
        case 5:
        {
            NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"hello Test1 Call Back",@"key", nil];
            [[SDCUrlRouteCenter sharedCenter]open:localRouteUrl(RouteToTestVC) animated:YES extraParams:dict WithReloadBlock:^(id customValue) {
               
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:customValue delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                [alertView show];
                
            }];
            
        }
            break;
        case 6:
        {
            NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"hello Test1 Call Back",@"key", nil];
            
            [[SDCUrlRouteCenter sharedCenter]open:localRouteUrl(RouteToTestVC) animated:YES URLRedirectType:kUrlRedirectPresent extraParams:dict WithReloadBlock:^(id customValue) {
                
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:customValue delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                [alertView show];

            }];
        }
            break;
        case 7:
        {
            [[SDCUrlRouteCenter sharedCenter]open:localRouteUrl(@"helloworld") animated:YES];
        }
            break;
        default:
            break;
    }
}

````

