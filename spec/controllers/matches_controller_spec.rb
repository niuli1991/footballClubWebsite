require 'rails_helper'


RSpec.describe MatchesController, type: :controller do

	shared_examples "公共方法(已登录)" do
		describe "get #show" do
			it "根据ID访问一个赛事详细match" do
				match = create(:match)
				get :show, id: match
				expect(assigns(:match)).to eq match
			end

			it "渲染show模板" do
				match = create(:match)
				get :show, id: match
				expect(response).to render_template :show
			end
		end
		

		describe "get #new" do
			it "生成一个新的Match对象给实例变量@match" do
				get :new
				expect(assigns(:match)).to be_a_new(Match)
			end

			it "渲染new模板" do
				get :new
				expect(response).to render_template :new
			end
		end


		describe "get #edit" do
			it "生成一个请求到match编辑页面" do
				match = create(:match)
				get :edit, id: match
				expect(assigns(:match)).to eq match
			end

			it "渲染edit模板" do
				match = create(:match)
				get :edit, id: match
				expect(response).to render_template :edit
			end
		end

		describe "post #create" do
			context "有效的参数" do
				it "保存一条新的赛事记录进数据库" do
					expect{
						post :create, match: attributes_for(:match)
					}.to change(Match, :count).by(1)
				end

				it "重定向到show模板" do
					post :create, match: attributes_for(:match)
					expect(response).to redirect_to match_path(assigns[:match])
				end
			end

			context "无效的参数" do
				it "新的赛事记录保存失败" do
					expect{
						post :create, match: attributes_for(:match, match_title: nil)
					}.to change(Match, :count).by(0)
				end

				it "重定向到new模板" do
					post :create, match: attributes_for(:match, match_title: nil)
					expect(response).to render_template :new
				end
			end
		end

		describe "patch #update" do
			before :each do
				@match = create(:match, match_title: '中甲联赛', match_type: '中甲联赛')
			end
			context "有效的参数" do
				it "匹配一条赛事记录" do
					patch :update, id: @match, match: attributes_for(:match)
					expect(assigns[:match]).to eq @match
				end

				it "更新@match的属性值" do
					patch :update, id: @match, match: attributes_for(:match, match_title: "中超联赛")
					@match.reload
					expect(@match.match_title).to eq('中超联赛')
				end

				it "重定向到更新后的match" do
					patch :update, id: @match, match: attributes_for(:match, match_title: '中超联赛')
					expect(response).to redirect_to @match
				end
			end

			context "无效的参数" do
				it "没有修改记录属性值" do
					patch :update, id: @match, match: attributes_for(:match, match_title: nil, match_type: '中超联赛')
					@match.reload
					expect(@match.match_title).to eq '中甲联赛'
					expect(@match.match_type).to_not eq '中超联赛'
				end
				it "重定向到edit模板" do
					patch :update, id: @match, match: attributes_for(:match, match_title: nil, match_type: '中超联赛')
					expect(response).to render_template :edit
				end
			end
		end

		describe "delete #destroy" do
			before :each do
				@match = create(:match)
			end

			it "成功删除记录" do
				expect{
					delete :destroy, id: @match
				}.to change(Match, :count).by(-1)
			end

			it "成功删除记录,重定向到赛事列表" do
				delete :destroy, id: @match
				expect(response).to redirect_to matches_path
			end
		end
	end

	describe "管理员权限" do
		before :each do
			@user = create(:user)
			sign_in @user
		end
		it_behaves_like "公共方法(已登录)"
	end

	describe "游客访问" do
		before :each do	
			@match = create(:match)
		end

		it "访问赛事列表" do
			get :index
			expect(assigns(:matches)).to eq [@match]
		end

		it "访问赛事详情" do
			get :show, id: @match
			expect(assigns(:match)).to eq @match
		end

		it "访问新建赛事页面，重定向到登录页面" do
			get :new
			expect(response).to redirect_to new_user_session_path
		end

		it "访问赛事编辑页面，重定向到登陆页面" do
			patch :edit, id: @match
			expect(response).to redirect_to new_user_session_path
		end

		it "新建赛事记录，重定向到登陆页面" do
			post :create, id: create(:match), match: attributes_for(:match)
			expect(response).to redirect_to new_user_session_path
		end

		it "删除赛事记录，重定向到登陆页面" do
			delete :destroy, id: @match
			expect(response).to redirect_to new_user_session_path
		end
	end

end
